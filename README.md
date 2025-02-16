### AWS-Application loadbalancer 3 Tier Architecture with Terraform
This project utilized terraform modules to provision resources in two availability zones i.e. `VPC`,`ALB`, `NAT`, `Multiple EC2 Instances`, `Security Groups`, `Public` and `Private Subnets`
#### Terraform Execution Commands
- Terraform Initialize `terraform init`
- Observation: Initialized Local Backend, Downloaded the provider plugins (initialized plugins) and Review the folder structure `.terraform folder`
- Terraform Validate `terraform validate`
- `Observation:` If any changes to files, those will come as printed in stdout (those file names will be printed in CLI)
- Terraform Plan `terraform plan` -> Observation: `No changes - Just prints the execution plan`
- Terraform Apply `terraform apply` then approve OR `terraform apply -auto-approve`
- Terraform Destroy `terraform plan destroy` then approve OR `terraform destroy -auto-approve`
- Clean-Up Files: `rm -rf .terraform*` and `rm -rf terraform.tfstate*`
#### Connect to Private EC2 Instances from Bastion EC2 Instance
- Connect with this command `ssh -i private-key/cfn-key-1.pem ec2-user@PUBLIC_IP`
- Curl Test for Bastion EC2 Instance to Private EC2 Instances `curl  http://<Private-Instance-1-Private-IP>` OR `curl  http://<Private-Instance-2-Private-IP>`
- Connect to Private EC2 Instances from Bastion EC2 Instance `ssh -i /tmp/cfn-key-1.pem ec2-user@<Private-Instance-1-Private-IP>`
- cd `/var/www/html`
#### Observation: 
1) list all the files `ls -lrta`
2) Should find `index.html`
3) Should find `app1 folder`
4) Should find `app1/index.html` file
5) Should find `app1/metadata.html` file
6) If required verify same for second instance too.
7) Additionally To verify userdata passed to Instance `curl http://IP_ADDRESS/latest/user-data`
`UPDATE:`Instance_count changed to for-each -> meta-arguments
#### For Errors
- Booting Error can be accessed through `cd /var/log` using the root user to view the provisioned resources`more cloud-init-output.log`