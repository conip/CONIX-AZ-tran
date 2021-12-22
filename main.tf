module "az-trans-eu-central-1" {
  source              = "./modules/avx-azure-transit"
  region              = "Central US"
  account             = var.avx_az_account_name
  cidr                = "10.111.0.0/23"
  gw_name             = "TRANS-1-AZ"
  vnet_name           = "VNET-${var.lab_env}-TRANS-1"
  local_as_number     = "65001"
  #enable_bgp_over_lan = true
  enable_segmentation = false
  instance_size       = "Standard_B4ms"
  ha_gw               = true
  bgp_ecmp            = true
}

