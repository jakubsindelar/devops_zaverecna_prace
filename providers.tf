# providers.tf
provider "aws" {
  alias   = "ecr"
  region  = "us-east-1"
  profile = "ecr_profile"
}

provider "aws" {
  alias   = "iam"
  region  = "us-east-1"
  profile = "main"
}
