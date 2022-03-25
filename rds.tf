#data "huaweicloud_availability_zones" "myaz" {}

resource "random_password" "mypassword" {
  length           = 12
  special          = true
  override_special = "!@#%^*-_=+"
}
resource "huaweicloud_rds_instance" "myinstance" {
  name                = "mysql_instance"
  flavor              = "rds.mysql.c2.large.ha"
  ha_replication_mode = "async"
  vpc_id              = huaweicloud_vpc.vpc.id
  subnet_id           = huaweicloud_vpc_subnet.mysubnet.id
  security_group_id   = huaweicloud_networking_secgroup.mysecgroup.id
  availability_zone   = ["ap-southeast-3a"]
  #huaweicloud_availability_zones.myaz.names.id
  
  db {
    type     = "MySQL"
    version  = "8.0"
    password = random_password.mypassword.result
  }
  volume {
    type = "ULTRAHIGH"
    size = 40
  }
}