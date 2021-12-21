#------------ AZURE
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}


variable "avx_az_account_name" {
  description = "The Azure account name, as known by the Aviatrix controller"
  type        = string
}
variable "lab_env" {
  description = "Environment variable saying what is the purpose of this deployment"
  type        = string
  default     = "test"
}
variable "avx_controller_admin_password" {
  type        = string
  description = "aviatrix controller admin password"
}
variable "avx_controller_ip" {
  type        = string
  description = "aviatrix controller "
}




