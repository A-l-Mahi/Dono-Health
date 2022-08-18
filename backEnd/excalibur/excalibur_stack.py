from aws_cdk import App, Stack
from constructs import Construct
from aws_cdk import (
    App,
    Stack,
    aws_apigateway as apigw,
    aws_lambda,
    aws_lambda_event_sources as lambda_event_sources,
    aws_iam,
    aws_logs,
    aws_dynamodb,
    aws_kinesis,
    aws_qldb,
    RemovalPolicy,
    CfnOutput,
    )
from constructs import Construct
from config_file import config

LEDGER_NAME = config['ledger_name']
ACCOUNT = config['account']
REGION = config['region']
LOG_LEVEL = config['log_level']
QLDB_TABLE_NAME = config['qldb_table_name']
LOG_RETENTION = config['log_retention']
SHARD_COUNT = config['shard_count']
TTL_ATTRIBUTE = config['ttl_attribute']
EXPIRE_AFTER_DAYS = config['expire_after_days']

class ExcaliburStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

            # Create QLDB Ledger and IAM Roles
        qldb_ledger = aws_qldb.CfnLedger(self, 'excalibur-1818', permissions_mode='ALLOW_ALL',
                                         name=LEDGER_NAME)

        # Create Kinesis Stream
        kinesis_stream = aws_kinesis.Stream(self, 'wallet-kinesis-stream', shard_count=SHARD_COUNT,
                                            stream_name=f"kinesis-stream-{LEDGER_NAME}")
        # Grant QLDB access to the Kinesis stream
        qldb_stream_inline_policy_statement = aws_iam.PolicyStatement(
            actions=['kinesis:DescribeStream', 'kinesis:PutRecord', 'kinesis:PutRecords', 'kinesis:ListShards',
                     'kinesis:ListShardIterators'],
            effect=aws_iam.Effect.ALLOW, resources=[kinesis_stream.stream_arn])
        qldb_stream_inline_policy_document = aws_iam.PolicyDocument(statements=[qldb_stream_inline_policy_statement])
        qldb_stream_role = aws_iam.Role(self, 'qldb-stream-role', assumed_by=aws_iam.ServicePrincipal(service='qldb'),
                                        inline_policies={'qldb_inline_policy': qldb_stream_inline_policy_document})
        


        # DynamoDB Table definition
        ddb_table = aws_dynamodb.Table(self, 'ddb-transactions-table', table_name=f"wallet-transactions-{LEDGER_NAME}",
                                       partition_key=aws_dynamodb.Attribute(name='accountId',
                                                                            type=aws_dynamodb.AttributeType.STRING),
                                       billing_mode=aws_dynamodb.BillingMode.PAY_PER_REQUEST,
                                       sort_key=aws_dynamodb.Attribute(name='txTime',
                                                                       type=aws_dynamodb.AttributeType.STRING),
                                       removal_policy= RemovalPolicy.DESTROY,
                                       time_to_live_attribute=TTL_ATTRIBUTE)

        # Create IAM Roles and policies for Lambda functions
        qldb_access_policy = aws_iam.PolicyStatement(actions=['qldb:SendCommand'], effect=aws_iam.Effect.ALLOW,
                                                     resources=[
                                                         f"arn:aws:qldb:{REGION}:{ACCOUNT}:ledger/{LEDGER_NAME}"])

        ddb_table_policy = aws_iam.PolicyStatement(actions=['dynamodb:Query', 'dynamodb:PutItem'],
                                                   effect=aws_iam.Effect.ALLOW,
                                                   resources=[ddb_table.table_arn])

        # Create Lambda role and policies
        lambda_qldb_role = aws_iam.Role(self, 'lambda-qldb-role', assumed_by=aws_iam.ServicePrincipal(service='lambda'))
        lambda_qldb_role.add_to_policy(qldb_access_policy)
        lambda_qldb_role.add_managed_policy(
            aws_iam.ManagedPolicy.from_aws_managed_policy_name(managed_policy_name='AWSLambdaExecute'))
        lambda_ddb_role = aws_iam.Role(self, 'lambda-ddb-role',
                                       assumed_by=aws_iam.ServicePrincipal(service='lambda'))
        lambda_ddb_role.add_managed_policy(
            aws_iam.ManagedPolicy.from_aws_managed_policy_name(managed_policy_name='AWSLambdaExecute'))
        lambda_ddb_role.add_to_policy(ddb_table_policy)

        # Create Lambda functions
        lambda_get_funds = aws_lambda.Function(self, 'get-funds-lambda', code = aws_lambda.Code.from_asset('./lambda/lambda_get_funds'),
                                                            handler='lambda_handler',
                                                            runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                            )


        lambda_withdraw_funds = aws_lambda.Function(self, 'withdraw-funds-lambda',
                                                                 code =aws_lambda.Code.from_asset('./lambda/lambda_withdraw_funds'),
                                                                 handler='lambda_handler',
                                                                 runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                                )

        lambda_add_funds = aws_lambda.Function(self, 'add-funds-lambda',
                                                            code = aws_lambda.Code.from_asset('./lambda/lambda_add_funds'),
                                                            handler='lambda_handler',
                                                            runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                            )

        lambda_create_account = aws_lambda.Function(self, 'create-account-lambda',
                                                            code = aws_lambda.Code.from_asset('./lambda/lambda_create_account'),
                                                            handler='lambda_handler',
                                                            runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                                 )

        lambda_get_transactions = aws_lambda.Function(self, 'get-transactions-lambda',
                                                                code = aws_lambda.Code.from_asset('./lambda/lambda_get_transactions'),
                                                                handler='lambda_handler',
                                                                runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                                   )

        lambda_stream_transactions = aws_lambda.Function(self, 'stream-transactions-lambda',
                                                                code = aws_lambda.Code.from_asset('./lambda/lambda_stream_transactions'),
                                                                handler='lambda_handler',
                                                                runtime=aws_lambda.Runtime.PYTHON_3_8,
                                                                      )
        # Associate the Kinesis stream to lambda_stream_transactions as an event source
        event_source = lambda_event_sources.KinesisEventSource(kinesis_stream,
                                                               starting_position=aws_lambda.StartingPosition.TRIM_HORIZON,
                                                               enabled=True, bisect_batch_on_error=True)
        lambda_stream_transactions.add_event_source(event_source)

        # Add environment variables to Lambda functions
        for lmbd in [lambda_create_account, lambda_get_funds, lambda_withdraw_funds, lambda_add_funds,
                     lambda_get_transactions]:
            lmbd.add_environment(key='LEDGER_NAME', value=LEDGER_NAME)
            lmbd.add_environment(key='QLDB_TABLE_NAME', value=QLDB_TABLE_NAME)
            lmbd.add_environment(key='LOG_LEVEL', value=LOG_LEVEL)
        lambda_get_transactions.add_environment(key='DDB_TABLE_NAME', value=f"wallet-transactions-{LEDGER_NAME}")

        lambda_stream_transactions.add_environment(key='DDB_TABLE_NAME', value=f"wallet-transactions-{LEDGER_NAME}")
        lambda_stream_transactions.add_environment(key='QLDB_TABLE_NAME', value=QLDB_TABLE_NAME)
        lambda_stream_transactions.add_environment(key='LOG_LEVEL', value=LOG_LEVEL)

        if TTL_ATTRIBUTE and EXPIRE_AFTER_DAYS:
            lambda_stream_transactions.add_environment(key='TTL_ATTRIBUTE', value=TTL_ATTRIBUTE)
            lambda_stream_transactions.add_environment(key='EXPIRE_AFTER_DAYS', value=str(EXPIRE_AFTER_DAYS))

        # Create APIs in API Gateway
        get_funds_api = apigw.LambdaRestApi(self, 'get-funds-api', handler=lambda_get_funds,
                                            endpoint_types=[apigw.EndpointType.REGIONAL],
                                            default_method_options=apigw.MethodOptions(
                                            authorization_type=apigw.AuthorizationType.IAM))
        create_account_api = apigw.LambdaRestApi(self, 'create-account-api', handler=lambda_create_account,
                                                endpoint_types=[apigw.EndpointType.REGIONAL],
                                                default_method_options=apigw.MethodOptions(
                                                authorization_type=apigw.AuthorizationType.IAM))
        withdraw_funds_api = apigw.LambdaRestApi(self, 'withdraw-funds-api', handler=lambda_withdraw_funds,
                                                 endpoint_types=[apigw.EndpointType.REGIONAL],
                                                 default_method_options=apigw.MethodOptions(
                                                authorization_type=apigw.AuthorizationType.IAM))
        add_funds_api = apigw.LambdaRestApi(self, 'add-funds-api', handler=lambda_add_funds,
                                            endpoint_types=[apigw.EndpointType.REGIONAL],
                                            default_method_options=apigw.MethodOptions(
                                            authorization_type=apigw.AuthorizationType.IAM))

        get_transactions_api = apigw.LambdaRestApi(self, 'get-transactions-api', handler=lambda_get_transactions,
                                                   endpoint_types=[apigw.EndpointType.REGIONAL],
                                                   default_method_options=apigw.MethodOptions(
                                                    authorization_type=apigw.AuthorizationType.IAM))

        output1 = f"Execute the following queries in QLDB query editor for ledger {LEDGER_NAME} before using:"
        output2 = f"CREATE TABLE \"{QLDB_TABLE_NAME}\""
        output3 = f"CREATE INDEX ON \"{QLDB_TABLE_NAME}\" (accountId)"

        CfnOutput(self, id='stack-output1', value=output1)
        CfnOutput(self, id='stack-output2', value=output2)
        CfnOutput(self, id='stack-output3', value=output3)
