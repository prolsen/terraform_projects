# Azure Terraform Template

This will build a Windows 7, Windows 10, and Windows Server 2016 Azure infra environment.

All of the settings in the terraform.tfvars are customizable. For example, if you want count = 10 Windows 10 Pro machines you just change the count to 10 and it will build 10 of them.

Same with usersnames and passwords, IP addresses, subnets, VM network, and even the images used to build the machines. Just change it in the terraform.tfvars file.