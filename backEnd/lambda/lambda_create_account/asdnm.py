# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0


from pyqldb.driver.qldb_driver import QldbDriver
from pyqldb.config.retry_config import RetryConfig

import os
import logging
import json
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all
import string, secrets

#logger = logging.getLogger()
#logger.setLevel(os.getenv('LOG_LEVEL'))

LEDGER_NAME = os.getenv('LEDGER_NAME')
QLDB_TABLE_NAME = "actors"
retry_config = RetryConfig(retry_limit=3)

# Initialize the driver
qldb_driver = QldbDriver(ledger_name=LEDGER_NAME, retry_config=retry_config)

return_object = {}

def generator(executor):
    alphabet = string.ascii_letters + string.digits
    accountId = ''.join(secrets.choice(alphabet) for i in range(11))
    cursor = executor.execute_statement(f"SELECT * FROM \"{QLDB_TABLE_NAME}\" WHERE accountId = ? ", accountId)
    first_record = next(cursor, None)
    if first_record:
        generate(executor)
    return accountId

    
def login(username, password, executor): 
    cursor = executor.execute_statement(f"SELECT * FROM \"{QLDB_TABLE_NAME}\" WHERE username = ? ", username)
    first_record = next(cursor, None)
    print("true")
    if not first_record:
        return_error("Account does not exists", http_status_code=400)
        return return_object
    else:
        http_status_code = 200
        return_message['status'] = 'Ok'
        return_message['message'] = "Account validated"
    

        return_object = {
            "statusCode": http_status_code,
            "body": json.dumps(return_message),
            "isBase64Encoded": False
        }
    
    
def return_error(message, http_status_code=500):
    global return_object
    return_message = {'status': 'error', 'message': message}
    return_object = {
        "statusCode": http_status_code,
        "body": json.dumps(return_message),
        "isBase64Encoded": False
    }
    #logger.error(return_message)
    return return_object

def read_documents(transaction_executor):
    cursor = transaction_executor.execute_statement(f"SELECT * FROM {QLDB_TABLE_NAME} WHERE usernames = ?", '1223')
    first_record = next(cursor, None)
    if first_record:
    # Record already exists, no need to insert
        print("there")
    else:
        pass
    for doc in first_record:
        print(doc)

def create_account(account_id, username, password, executor):
    global return_object
    return_message = {}

    #logger.info(f"Verifying account with id {account_id} does not exist")

    cursor = transaction_executor.execute_statement(f"SELECT * FROM {QLDB_TABLE_NAME} WHERE usernames = ?", '1223')
    first_record = next(cursor, None)
    
    if first_record:
        return_error(f"Account with user id {username} already exists", http_status_code=400)
        return return_object
    else:
        doc = {
            'accountId': account_id,
            'usernames': username,
            'password': password,
            'balance': 0
        }
#        logger.info(f"Creating account with id {account_id} and balance = {doc['balance']}")
        executor.execute_statement(f"INSERT INTO \"{QLDB_TABLE_NAME}\" ?", doc)
        print("save")
    http_status_code = 200
    return_message['status'] = 'Ok'
    return_message['accountId'] = account_id


    return_object = {
        "statusCode": http_status_code,
        "body": json.dumps(return_message),
        "isBase64Encoded": False
    }


def lambda_handler(event, context):
#    logger.debug(f"Event received: {json.dumps(event)}")

    global return_object
    return_object = {}
    body = {}
    body = event['credentials']
    body['accountId'] = qldb_driver.execute_lambda(lambda executor: generator(executor))

    if event['type'] == "login":
        try:
            qldb_driver.execute_lambda(lambda executor: login(body['username'], body['password'], executor))
        except Exception as e:
            return_error(str(e), http_status_code=500)
            return return_object
        else:
            return_error('Parameters not specified', http_status_code=400)
            return return_object

    elif event['type'] == "create":
        try:
            qldb_driver.execute_lambda(lambda executor: create_account(body['accountId'], body['username'], body['password'], executor))
        except Exception as e:

            return_error(str(e), http_status_code=500)
            return return_object
    else:
        return_error('Parameters not specified', http_status_code=400)

    return return_object