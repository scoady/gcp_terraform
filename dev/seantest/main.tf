terraform {
  backend "gcs" {
    bucket  = "seancloud-tf-state-dev"
    prefix  = "terraform/state"
  }
}

module "module_baseimage" {
  source                 = "../../module"
  server_provision	 = 1
  display-name			 = "seantest"
  subnet 		= "admin"
}
