terraform {
  backend "s3" {
    bucket = "jaz-tfstate-bucket"
    key    = "aws-projects/kubernetes-basic/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}