
#VPC

resource "huaweicloud_vpc" "vpc" {
  name = "vpc-web"
  cidr = "192.168.0.0/16"
}

#Subnet
resource "huaweicloud_vpc_subnet" "mysubnet" {
  name       = "subnet-web"
  cidr       = "192.168.10.0/24"
  gateway_ip = "192.168.10.1"
  vpc_id     = huaweicloud_vpc.vpc.id
  dns_list   = ["100.125.1.250", "100.125.129.250"]
}

#Security Group



resource "huaweicloud_networking_secgroup" "mysecgroup" {
  name                 = "secgroup"
  description          = "My security group"
  delete_default_rules = true
}
resource "huaweicloud_networking_secgroup_rule" "secgroup_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = huaweicloud_networking_secgroup.mysecgroup.id
}