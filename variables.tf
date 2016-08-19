variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "aws_region" {
  description = "AWS Region to launch configuration in"
}
variable "ssh_public_key" {
  description = "SSH public key to give SSH access"
}
### Optional Parameters ###

variable "master-instance-type" {
  description = "Master instance type"
  default = "m3.xlarge"
}
variable "data-instance-type" {
  description = "Data instance type"
  default = "m3.xlarge"
}

variable "data-instance-count" {
  description = "Number of Data instances"
  default = "1"
}
variable "query-instance-type" {
  description = "Query instance type"
  default = "m3.xlarge"
}

variable "query-instance-count" {
  description = "Number of Query instances"
  default = "1"
}
variable "coreos_amis" {
  description = "AMI for CoreOS machine"
  default = {
    us-west-1       = "ami-d8770bb8"
    ap-northeast-1  = "ami-e304148d"
    ap-northeast-2  = "ami-131dd47d"
    us-gov-west-1   = "ami-cf19a5ae"
    us-west-2       = "ami-4f7f8a2f"
    us-east-1       = "ami-7a627510"
    sa-east-1       = "ami-d75bd4bb"
    ap-southeast-2  = "ami-a184a7c2"
    eu-west-1       = "ami-3b941448"
    eu-central-1    = "ami-e13fde8e"
    ap-southeast-1  = "ami-52a07531"
  }
}

variable "ubuntu_amis" {
  description = "Ubuntu AMIs for regions"
  default = {
    us-west-1       = "ami-1dec736e"
    ap-northeast-1  = "ami-1707ec76"
    us-west-2       = "ami-e97d8789"
    us-east-1       = "ami-304b8e5d"
    sa-east-1       = "ami-8d9913e1"
    ap-southeast-2  = "ami-62e3ca01"
    eu-west-1       = "ami-564e0b36"
    eu-central-1    = "ami-e3f0198c"
    ap-southeast-1  = "ami-eda0738e"
  }
}
variable "vpc_subnet_range" {
  descpiption = "The IP range of the VPC subnet"
  default = "10.0.0.0/16"
}
variable "coordinator_subnet_range" {
  descpiption = "The IP range of the coordinator subnet"
  default = "10.0.0.0/16"
}