🌱 Project Story 1: "Startup Web App Launch"
Background
A small startup is preparing to launch their first web application. They want a minimal but production-ready AWS infrastructure that can scale later. As the DevOps lead, you’re tasked with building this infra entirely using Terraform modules so it’s reusable and clean.

Requirements
Networking Layer

Create a VPC with 2 public subnets and 2 private subnets across different AZs.

Internet Gateway for public subnets.

NAT Gateway for private subnets (to allow outbound traffic).

Route tables configured accordingly.

Compute Layer

An EC2 Auto Scaling Group in private subnets for the application servers.

Launch template with user data to install Nginx.

Security groups:

Allow HTTP/HTTPS from the internet to the ALB.

Allow ALB to talk to EC2 instances.

Restrict SSH to a specific IP (developer’s office).

Load Balancing

Application Load Balancer in public subnets.

Target group pointing to EC2 instances.

Listener for HTTP (port 80).

Storage

An S3 bucket for static assets (images, CSS, JS).

Bucket policy to allow public read for assets only.

IAM

Create an IAM role for EC2 instances with permissions to read from the S3 bucket.

Developer IAM user with programmatic access restricted to dev environment only.

Module Approach
vpc module → builds VPC, subnets, IGW, NAT, route tables.

ec2 module → builds ASG + Launch Template + SG.

alb module → builds ALB + target groups + listeners.

s3 module → builds asset bucket + policy.

iam module → builds roles and users.

Complexity Highlights
You’ll need to handle dependencies (e.g., NAT depends on IGW).

Use outputs to pass subnet IDs from the VPC module into EC2/ALB modules.

Implement variable-driven design so the same modules can be reused later for staging/production.

Add tags everywhere for cost tracking.