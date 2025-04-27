# aws-ecs-tf-workspace

#pre-requesites

1. Install AWS CLI (if not installed)
aws --version
If version shows ✅, skip to step 2.
If not installed, install it:
brew install awscli

2. Configure AWS CLI with your credentials
   aws configure
   Terraform will automatically pick credentials from here!
   Question | What to Enter
   AWS Access Key ID | Your AWS access key
   AWS Secret Access Key | Your AWS secret key
   Default region name | ap-south-1 (or your region)
   Default output format | json

Install Terraform on Mac (Step-by-Step)
1. Install with Homebrew (easiest way)
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
2. Verify Terraform Installation
   terraform version
   You should see something like:
   Terraform v1.8.2
   on darwin_amd64

Create s3 bucket - <your-terraform-backend-bucket>
update bucket name in file : aws-ecs-tf-workspace/terraform/backend.tf

Create DynamoDB Table manually (Quickest way)
Go to AWS Console ➔ Services ➔ DynamoDB
Click "Create table"
Sample First Deploy Flow
cd aws-ecs-tf-workspace/terraform
   terraform init
cd ..
   bash deploy.sh dev

Step 1: terraform init
Output will look like:

Initializing the backend...
Initializing provider plugins...
Terraform has been successfully initialized!

You may now begin working with Terraform.

Step 2: bash deploy.sh dev
Script will:
Create/select dev workspace
Plan the changes
Apply the infrastructure
Terminal output will look like:
Creating workspace "dev"...
Switched to workspace "dev".

Terraform has been successfully initialized!

Refreshing Terraform state...

Terraform will perform the following actions:


Plan: 10 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value:
You don't have to type anything because -auto-approve is set in deploy.sh.

Then apply starts:



Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

ecs_cluster_id = "<ECS_CLUSTER_ID>"
private_subnet_ids = [
"<Private_Subnet_1_ID>",
"<Private_Subnet_2_ID>"
]
vpc_id = "<VPC_ID>"
✅ Deployment successful!

✅ ECS infra is now live inside your AWS account!

🏗 What gets created:

Resource | Purpose
VPC | New isolated network
Public + Private Subnets | 2+2 subnets
ECS Cluster | Dev ECS Cluster
EC2 Launch Template | ECS-ready EC2
AutoScaling Group | EC2 instances auto management
Security Group | Allow SSH + HTTP
IAM Roles | Allow EC2 to register to ECS

🎯 That's your first successful deploy experience!
✅ Then, you can go to AWS Console ➔ ECS ➔ see your dev-ecs-cluster!
✅ Inside EC2 Console ➔ see your ECS nodes launched!


