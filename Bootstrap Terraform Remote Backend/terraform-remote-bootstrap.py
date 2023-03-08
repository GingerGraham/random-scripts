#!/usr/bin/env python3
import sys
import argparse
import logging
import time
import concurrent.futures
import boto3
from botocore.exceptions import ClientError,ParamValidationError
from datetime import datetime,timezone


# Global Variables
log_level=logging.INFO
log_format='%(asctime)s [%(levelname)s] %(message)s'
log_file="/dev/null"
date = datetime.now().strftime('%Y-%m-%d')
timestamp = datetime.now(timezone.utc).strftime('%H:%M')
aws_session = None
args = None # Arguments passed from command line


def process_args():
  try:
    # Handle command line arguments
    all_args = argparse.ArgumentParser(description='AWS S3 Terraform Remote Backend Bootstrap')
    # AWS Connection Details arguments
    connection_group = all_args.add_argument_group('AWS Connection Details')
    connection_group.add_argument('--aws-profile', '-a', required=False, default='default', help='AWS Profile: default = default (Example: -a vcra-prod)', type=str)
    connection_group.add_argument('--region', '-r', required=False, default='us-east-1',help="AWS Region: default = us-east-1 (Example: -r us-east-2)", type=str)
    # Log configuration arguments
    log_group = all_args.add_argument_group('Log Options')
    log_group.add_argument('--log-file', '-l', required=False, help='Log file location (Example: -l /tmp/createAMI.log)', type=str)
    log_group.add_argument('--log-level', '-ll', required=False, default='INFO', help='Log level: default = INFO (Example: -ll DEBUG)', type=str)
    # All processed arguments are stored in args variable
    args=all_args.parse_args()
  except:
    logging.error("Unexpected error in process_args: {0}".format(sys.exc_info()[0]))
    sys.exit(1)

# Parse passed arguments and update logging variables if needed
for key, value in vars(args).items():
    if (key == 'log_file' and not value is None):
        log_file=value
    if key == 'log_level':
        log_level=value.upper()

# Configure logging
logging.basicConfig(
    level=log_level,
    format=log_format,
    handlers=[
        logging.FileHandler(log_file),
        logging.StreamHandler(sys.stdout)
    ]
    )

def print_args(args): # Print arguments passed from command line
    logging.info("Supplied arguments")
    logging.info("===================")
    for key, value in vars(args).items():
        # Replace _ with space and capitalize first letter of each word
        key = key.replace("_"," ").title()
        logging.info('{0} : {1}'.format(key, value))
    logging.info("===================")

def aws_connect(args): # Connect to AWS
    try:
        global aws_session
        logging.info("Connecting to AWS")
        # Check if an AWS profile was passed as an arugment and if so use it to establish an AWS session
        if
        aws_session = boto3.Session(profile_name=args.aws_profile,region_name=args.region)

        logging.info("Connected to AWS")
        logging.info("Session Details: {0}".format(aws_session))
        logging.info("===================")
    except ClientError as e:
        logging.error("Error in aws_connect: {0}".format(e))
        sys.exit(1)
    except:
        logging.error("Unexpected error in aws_connect: {0}".format(sys.exc_info()[0]))
        sys.exit(1)