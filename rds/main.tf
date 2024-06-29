data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "mirzoevazara"
    workspaces = {
      name = "vpc"
    }
  }
}


resource "aws_db_subnet_group" "cloud" {
  name       = "cloud"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets
}







