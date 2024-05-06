# Test How to Connect To a Private RDS MySQL DB automatically using GitHub actions workflows

![image](https://github.com/mariemssi/Test_Connect_To_Private_RDS-MySQL_DB_2/assets/69463864/87c6c346-c4c7-4ef8-8def-a77e236322f9)


## Provisioning Test Infrastructure with Terraform
1. Clone the GitHub Repository: `git clone <repository_url>`
  
3. Ensure that Terraform is installed on your local machine or Install Terraform
   
5. Set Up AWS Credentials. You can do this by either:
    - Configuring AWS CLI with `aws configure` and providing your AWS access key ID, secret access key.
    - Setting the AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY environment variables.
      
6. Generate SSH Key pair: place the public key in root directory of your terraform code
   
6. Initialize Terraform: `terraform init`
   
8. Review Terraform Plan (Optional): `terraform plan`
   
   You can preview the changes Terraform will make to your infrastructure. For this, you should provide the Input Variables defined in variables.tf. You can define its default values in the variables.tf file or you can define it as parameters of terraform plan and terraform apply commands
   or Terraform will prompt you to provide their values during the terraform apply process.

   USERNAME and DB-PASSWORD are secrets and It's important to note that using these methods for secrets is not a best practice in production environments.
   For handling secrets securely, consider using more robust methods available in Terraform, such as using external secret management systems or environment variables.  
  
10. Apply Terraform Changes: `terraform apply`

    Wait for Terraform to Complete, this process may take some time. Once complete, Terraform will display a summary of the changes made.

## Testing the GitHub Actions Workflow

## Destroying Test Infrastructure
Destroy Resources (Optional): If you want to destroy the resources provisioned by Terraform, you can run the terraform destroy command. Be cautious, as this will delete all resources managed by Terraform in your AWS account.
bash
Copy code
terraform destroy
Commit and Push Changes (Optional): If you made any modifications to the Terraform code, you can commit your changes and push them to the GitHub repository.
That's it! You've successfully run Terraform code from a GitHub repository to provision resources on AWS. Make sure to follow best practices for managing infrastructure as code and keep your Terraform configurations version-controlled.
