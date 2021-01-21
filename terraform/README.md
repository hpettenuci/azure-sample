# Terraform 

File list:
- **00-variables**: Variables definition
- **01-main**: Terraform and Provider specification
- **02-resource-group**: Azure Resource Group Definition
- **03-aks-versions**: List of Kubernetes Versions available on AKS
- **04-**: AKS Analytics configuration
- **05-**: Azure AD configuration to use wiht AKS RABC
- **06-**: AKS Cluster specification
- **99-**: Output information of Terraform execution

To run all files it's necessary provide a valid data to all variables.


# Pipelines

Changes on infrastrutucte need to be managed as changes on application code. For this reason, terraform process are included on pipelines of the project. 

## Terraform Plan
- Triggered automaticaly when a Pull Request is created
- Executes:
    - Inicialization of Terraform Providers
    - Validation on format and resources declaration
    - Executes terraform plan that list all differences that need to be applied
- After executes all terraform steps, the process include on Pull Request discution a new comment that show all the results of terraform plan.

The main goal of this pipeline is provide all the information necessary to analyse wha changes will be made by terraform before run terraform apply.

## Terraform Apply
- Triggered automaticaly when push code to main branch or manually.
- Executes:
    - Inicialization of Terraform Providers
    - Terraform apply, that start to run all necessary process to change the infrastructure.

If you already have a good experience and consolidated process you can apply terraform changes when merge your code on main branch. For new users of this process that doesn't have a consolidated process to apply changes on infrastructure, it's recommended disable the automatic trigger and run it manually. 