![image](https://github.com/Yashbhoir/two_tier_aws_terraform/assets/37384149/ef44d98a-eac9-4001-8b8a-00667effbf33)

                                              2 Tier Architecture

The 2 Tier Architecture is distributed in different tf files which are used as modules in the **main.tf** file

**terraform.tf** file is used for default configuration terraform

**variable.tf** file consists of variable definition required for creation for infra through modules

4 variables used are :

cidr_block -> used for the creation of subnets we have 4 subnets 2 are private and 2 are public

az -> We have a total of 4 subnets of which 2 are private and 2 are public. We will will set one public subnet individually while remaining using a data source

instance_type -> used for setting up the type of instance to be used

instance_name -> We have a total of 4 instances 2 private and 2 public. We will create 2 private instance by configuring individually and 2 public by using loop


**terraform.tfvars** consists of variable values to be passed to used in different modules

We have created 6 modules each having a feature for infra to be deployed

**networking.tf** it consists of configuration details of  vpc , subnets , db subnet group , route table , internet gateway and route table association 












