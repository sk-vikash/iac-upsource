## Upsource on the AWS

Repo contains script to spinup a docker version of [upsource](https://www.jetbrains.com/upsource/).

## Technologies Used

```
AWS
Terraform
Bash
VSCode
```

## Prerequite

Create private and public key required in the script by executing the below command.

```
cd Upsource/
ssh-keygen -f test-P ""
```

Update the VPC name and Subnet name accordingly.

## Provision

```
cd Upsource/
terraform init
terraform apply --auto-approve
```

- Once infrastructure is created, use  **ip:8080** on the browser to open upsource.
- To obtained the token
  ```
  ssh -i test ubuntu@public_ip_of_instance
  docker logs $(docker ps -aq) | grep wizard_token 
  ```
- Use this token to signing and follow the instruction to set up upsource. For future use make sure to copy the license key.
  

## De-provision

Run below command to de-provision the infrastructure.

```
cd Upsource/
terraform destroy --auto-approve
```
