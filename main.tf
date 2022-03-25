terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      # version = "~> 3.1.2"
    }
  }
}


/*data "huaweicloud_vpc" "myvpc" {
  name = var.vpc_name
}
data "huaweicloud_vpc_subnet" "mysubnet" {
  vpc_id = data.huaweicloud_vpc.myvpc.id
  name   = var.subnet_name
}
data "huaweicloud_networking_secgroup" "mysecgroup" {
  
}
*/

/*
# Create a VPC
resource "huaweicloud_vpc" "example" {
  name = "my_vpc"
  cidr = "192.168.0.0/16"
}
resource "huaweicloud_vpc_subnet" "subnet" {
  name       = "test"
  cidr       = "192.168.1.0/24"
  gateway_ip = "192.168.1.0"
  vpc_id     = huaweicloud_vpc.example.id
}*/