# Cocus Code Challenge
> This challenge requires you to create a new VPC in the AWS cloud. VPC will requires 2 subnets, one subnet will have internet connectivity (Webserver) and second will be without internet connectivity (Database).
> Both subnets should be able to talk each other through the default routing table but this challenge will require security groups to be configured on specific ports.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.05 |
| hashicorp/aws | >= 2.68.* |
| ansible/ansible-vault | = 2.10.3 | 
| Python | = 3.6.8 | 

## Before you start
You should have the secret key sent through e-mail in order to decrypt the sensitive files. 

## Decrypt files
> In order to run the code you need to decrypt files code-challenge/prod/terraform.tfvars and code-challenge/prod/.hidden/access.pem
> You must run this commands inside the file directory.

```sh
$ ansible-vault decrypt --ask-vault-pass terraform.tfvars
Vault password:
Decryption successful

$ aansible-vault decrypt --ask-vault-pass access.pem
Vault password:
Decryption successful
```

## Deploying infrastructure
> For your commidity I have ran this script in region us-east-2, but feel free to test out.
> The script is going to deploy the resourcers in region eu-west-1
> Also, I have generated the terraform.tfvars file in prod directory only, the UAT directory is just to shown a concept where you can have multiple 
> environments using the same module/configuration by generating a terraform.tfvars file. 
> So please run command below under code-challenge/prod directory in order to create the resources.

```sh
$ terraform init
$ terraform plan -out main.tfplan
$ terraform apply "main.tfplan"
$ terraform destroy (Use this command after you've done all validations) 
```
## Accessing internal environment

```sh
Access local server.: 
In order to access the local server you need to run the following command line.
ssh -i .ssh/access.pem <Public_IP>

Note.: Public and Private IP will be shown after deployment, so you don't need to use console.
```

## Name Convention:
```sh
1) Use _ (underscore) instead of - (dash) in all: resource names, data source names, variable names, outputs.
2) Only use lowercase letters and numbers.
3) Do not repeat resource type in resource name (not partially, nor completely).
examples.
Good: resource "aws_route_table" "public" {}
Bad: resource "aws_route_table" "public_route_table" {}
4) Always use singular nouns for names.
5) Use - inside arguments values and in places where value will be exposed to a human (eg, inside DNS name of RDS instance).
```
