# Terraform Remote Backend Bootstrap

The purpose of this module is to bootstrap a Terraform remote backend on AWS S3.  This is a one-time operation that is required to use Terraform remote backend.  Once the remote backend is bootstrapped, you can use the remote backend to store the state of your Terraform infrastructure.

The created resources will also create a DynamoDB table to store the state lock.  This is required to prevent multiple users from modifying the state at the same time.
