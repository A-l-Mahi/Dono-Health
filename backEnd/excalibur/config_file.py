# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

from aws_cdk import (
    aws_logs
)

# For log_retention, see https://docs.aws.amazon.com/cdk/api/latest/python/aws_cdk.aws_logs/RetentionDays.html for possible values

config = {
    'log_retention': aws_logs.RetentionDays.ONE_MONTH, # See note above
    'ledger_name': 'excalibur-1818', # See for valid names: https://docsaws..amazon.com/qldb/latest/developerguide/limits.html#limits.naming
    'account': '947844451271', # Modify before deploying
    'region': 'us-east-2', # Modify before deploying
    'log_level': 'ERROR|INFO|DEBUG',
    'qldb_table_name': 'excalibur-8181',
    'shard_count': 1, # Kinesis Stream shard count
    'ttl_attribute': 'expire_timestamp', # Specify 'expire_timestamp' to enable TTL or None to disable TTL
    'expire_after_days': 30 # This property needs to be set to enable TTL on the transactions table in DynamoDB
}
