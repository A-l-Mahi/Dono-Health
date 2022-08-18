# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

from pyqldb.driver.qldb_driver import QldbDriver
from pyqldb.config.retry_config import RetryConfig
import os
import logging
import requests
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

def return_error(message, http_status_code=500):
    global return_object
    return_message = {'status': 'error', 'message': message}
    return_object = {
        "statusCode": http_status_code,
        "body": json.dumps(return_message),
    }
#    logger.error(return_message)
    return return_object
    
def generate(my_id, qty):
        vou = {}
        vou['user'] = my_id
        for val in range(qty):
            alphabet = string.ascii_letters + string.digits
            val = ''.join(secrets.choice(alphabet) for i in range(11))
            vou[f'{val}'] = True
        return vou

            
    
def processing(emaildd, cardNumber, bankName, expiry, cvv, amount, qty, executor):
    return_message = {}
    url = "https://fsi.ng/api/v1/flutterwave/v3/charges?type=card"
    
    payload = json.dumps({
      "client": "C10EgEYkJrusinoq55RgQ7rl+hlselSCuuX6GWx6VIJ7Ec7hXCGXup9Ukx8Luge/2HH2WYqXHvqdgrwMxhwlFMUV7tgqgH9ZCoe37pCnvkSkToNPiAbU0jG7L5i+WCxVR5/RaF0p0wbts8nb291rlgpnkk7QPuI2HcqR9R5Uairt/0O+PEmmFhF9v9A92X1w3zyAsGKQH98XxJxP9tAn176RahJL0upUhxrkJHoyJdaE55iicZGpg7Gu/CMYkgQHBGj3ODzL4Bla+pO+50wh5j2BIR+yjx8/V6uMw0qEPvfi5w+zQMoyQhFKvaYxk9P23L+SqR1tBzkty/aV4SCwLmpnzQnbXUewBqxZTQH+1MI="
    })
    headers = {
      'Content-Type': 'application/json',
      'sandbox-key': 't4sqorF1Y5XbWFSipeGV2GEU4Ge0A38v1660681692',
        'Authorization': 'dskjdks'
    }
    response = requests.request("POST", url, headers=headers, data=payload)
    if qty:
        qldb_driver.execute_lambda(lambda executor: add_funds(emaildd, amount, executor))
    else:
        print("Dono")
        vouchers = generate(emaildd, qty)
        return_message['status'] = 'Ok'
        return_message['email'] = emaildd
        return_message['vouchers'] = vouchers
        http_status_code = 200
        return_object = {
            "statusCode": http_status_code,
            'message':"Success",
            "body": json.dumps(return_message)
        }

        print(return_object)
    
    
def add_funds(emailId, amount, executor):
    
    return_message = {}
    global return_object

#    logger.info(f"Retrieving number of accounts for id {account_id}")
    cursor = executor.execute_statement(
        f"SELECT count(email) as number_of_accounts FROM \"{QLDB_TABLE_NAME}\" WHERE email = ? ", emailId)
    first_doc = next(cursor, None)

    if first_doc:
        if int(first_doc['number_of_accounts']) > 1:
            return_error(f"More than one account with user id {emailId}", http_status_code=500)
            return return_object

        if int(first_doc['number_of_accounts']) == 0:
            return_error(f"Account {eamilId} not found", http_status_code=400)
            return return_object

#    logger.info(f"Retrieving balance for UPDATE... for {account_id}")
    cursor = executor.execute_statement(f"SELECT email, balance FROM \"{QLDB_TABLE_NAME}\" WHERE email = ?", emailId)

    first_doc = next(cursor, None)

#    logger.info(f"Updating balance with {amount} for {account_id}")
    return_message['status'] = 'Ok'
    return_message['email'] = first_doc['email']
    return_message['old_balance'] = first_doc['balance']
    return_message['new_balance'] = int(first_doc['balance']) + int(amount)
    executor.execute_statement(f"UPDATE \"{QLDB_TABLE_NAME}\" SET balance = ? WHERE email = ?",
                               return_message['new_balance'], emailId)

    http_status_code = 200
    return_object = {
        "statusCode": http_status_code,
        'message':"Success",
        "body": json.dumps(return_message)
    }
    return return_object

def lambda_handler(event, context):
#    logger.debug(f"Event received: {json.dumps(event)}")

    global return_object
    return_object = {}
    
    if event['user'] == "insurer":
        event['qty'] = True
        qldb_driver.execute_lambda(lambda executor: processing(event['email'], event['cardNumber'], event['cardName'], event['expiry'], event['cvv'], event['amount'], event['qty'], executor))
    elif event['user'] == "vendor":
        event['qty'] = False
        qldb_driver.execute_lambda(lambda executor: processing(event['email'], event['cardNumber'], event['cardName'], event['expiry'], event['cvv'], event['amount'], event['qty'] , executor))
    return return_objectgit