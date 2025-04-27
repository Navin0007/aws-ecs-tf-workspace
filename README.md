# aws-ecs-tf-workspace
#Terraform code for cluster creation/destroy

#pre-requesites

1. Install AWS CLI (if not installed)


2. Configure AWS CLI with your credentials 
3. Install Terraform on Mac (Step-by-Step)
4. Create s3 bucket 
5. Create DynamoDB Table manually (Quickest way)
    Go to AWS Console ➔ Services ➔ DynamoDB
    Click "Create table"
    Sample First Deploy Flow
6. Clone and run the workflow
   cd aws-ecs-tf-workspace/terraform
      terraform init
   cd ..
      bash deploy.sh dev
7. Destroy the workflow
   bash destroy.sh dev

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


