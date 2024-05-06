# Testing Automatic Connection to a Private RDS MySQL DB with GitHub Actions Workflows

![image](https://github.com/mariemssi/Test_Connect_To_Private_RDS-MySQL_DB_2/assets/69463864/87c6c346-c4c7-4ef8-8def-a77e236322f9)


## Provisioning Test Infrastructure with Terraform
1. Clone the GitHub Repository: `git clone <repository_url>`
  
2. Ensure that Terraform is installed on your local machine or Install it
   
3. Set Up your AWS Credentials AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY.
        
4. Generate SSH Key pair: `ssh-keygen -f mykey`
   It generates 2 files mykey (private key) and mykey.pub (public key). Place the public key file in the root directory of your terraform code.

    You can also reference an aws key pair if you have already one. You should update ec2_bastion_host.tf accordingly.

   
   
6. Initialize Terraform: `terraform init`
   
7. Review Terraform Plan (Optional): `terraform plan`
   
   You can preview the changes Terraform will make to your infrastructure. For this, you should provide the Input Variables defined in variables.tf. You can define its values as default in the variables.tf file or you can define it as parameters of terraform plan and terraform apply commands
   or Terraform will prompt you to provide their values during the terraform apply process.

   😱 USERNAME and DB-PASSWORD are secrets and It's important to note that using these methods for secrets is not a best practice in production environments.
   For handling secrets securely, consider using more robust methods available in Terraform, such as using external secret management systems or environment variables.  
  
8. Apply Terraform Changes: `terraform apply`

    Wait for Terraform to Complete, this process may take some time. Once complete, Terraform will display a summary of the changes made.

## Testing the GitHub Actions Workflow

   1. Define the secrets of the GitHub Actions Workflow: Settings --> Secrets and Variables --> Actions --> New repository secret
  
   The secrets to define in your github repo are listed in the next screenshot 

  ![image](https://github.com/mariemssi/Test_Connect_To_Private_RDS-MySQL_DB_2/assets/69463864/f04587e7-334f-4fff-b53f-374dfa69cd0e)

  2. Trigger the pipeline by modifiying the script_bd.sql file and pushing the modification or manually like the screeshot below

  ![image](https://github.com/mariemssi/Test_Connect_To_Private_RDS-MySQL_DB_2/assets/69463864/23b192fb-8e70-494e-bd9e-c314ba130c39)

  If everything is fine ✔️, a connection to the DB will be established to execute the SQL code in script_db.sql. You receive a result like the screeshot below 🎉:

  ![image](https://github.com/mariemssi/Test_Connect_To_Private_RDS-MySQL_DB_2/assets/69463864/c40ac720-4a64-4cc3-a0e7-43715c140ade)

## Destroying Test Infrastructure
  Destroy Resources (Optional): `terraform destroy`
  Once you have finished testing, it's important to destroy the test environment to avoid incurring unnecessary charges from AWS 😉.
