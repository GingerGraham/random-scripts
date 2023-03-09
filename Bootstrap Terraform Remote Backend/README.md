# Terraform Remote Backend Bootstrap

The purpose of this script/module is to bootstrap a Terraform remote backend on AWS S3.  This is a one-time operation that is required to use Terraform remote backend.  Once the remote backend is bootstrapped, you can use the remote backend to store the state of your Terraform infrastructure.

The created resources will also, optionally, create a DynamoDB table to store the state lock.  This is required to prevent multiple users from modifying the state at the same time.

## Prequisites

The following prequisites are required to use this module:

### Python Modules

- boto3
- botocore

These are included in the provided requirements.txt file and can be installed using pip:

```bash
pip install -r requirements.txt
```

### AWS Credentials

The AWS credentials must be configured in the environment.  The following environment variables are required:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_DEFAULT_REGION (optional)
- AWS_SESSION_TOKEN (optional)

These can be provided as environmental variables or in a credentials file.  See the [AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html) for more information.

## Usage

The module can be used as a script or as a module.  The script is located in the `Bootstrap Terraform Remote Backend` directory; the script is named `terraform_remote_backend.py`.

The script provides a full help output:

```bash
$ python terraform_remote_backend.py --help
```

### Arguments


