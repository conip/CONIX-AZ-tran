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

resource "aviatrix_transit_external_device_conn" "azuussc1_vng2" {
  vpc_id             = module.az-trans-eu-central-1.vnet.vpc_id
  connection_name    = "${module.az-trans-eu-central-1.transit_gateway.gw_name}_to_vng" #"az-trans-eu-central-1""my_conn"
  gw_name            = module.az-trans-eu-central-1.transit_gateway.gw_name           #"transitGw"
  connection_type    = "bgp"
  tunnel_protocol    = "IPsec"
  bgp_local_as_num   = module.az-trans-eu-central-1.transit_gateway.local_as_number                                        #"123"
  bgp_remote_as_num  = "65515"                                                                                     # !! replace with mod var/output
  #remote_gateway_ip  = "${module.azu-ussc1-ars.azu-transit-vng_pip1},${module.azu-ussc1-ars.azu-transit-vng_pip2}" #"public_IP_VNG1, public_IP_VNG2"
  remote_gateway_ip  = "20.105.170.243,20.105.170.244" #"public_IP_VNG1, public_IP_VNG2"
  remote_tunnel_cidr = "169.254.21.1/30,169.254.22.1/30"                                                           # ! replace with mod var - "169.254.21.1/30,169.254.22.1/30"
  local_tunnel_cidr  = "169.254.21.2/30,169.254.22.2/30"
  ha_enabled         = false
  enable_ikev2       = true
  pre_shared_key     = "aviatrix$123"
  #depends_on        = [module.azu-ussc1-ars, module.az-trans-eu-central-1]
}