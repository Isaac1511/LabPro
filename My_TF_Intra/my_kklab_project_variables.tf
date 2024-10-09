# Define variables to be used with Terraform. 

# Define Sub-Id variable. 
variable "subscription_id" {
  type    = string
  default = "a2b28c85-1948-4263-90ca-bade2bac4df4"
}

# Define Resource Group variable.
variable "resource_group_name" {
  type    = string
  default = "kklab_group"
}

# Define Location variable.
variable "location" {
  type    = string
  default = "eastus"
}

# Define Virtual Network (vnet) variable.
variable "vnet_name" {
  type    = string
  default = "myKKVnet00121"
}

# Define Virtual Subnet (snet) variable.
variable "subnet_name" {
  type    = string
  default = "myKKSnet12100"
}

# Define Network Security Group (NSG) variable.
variable "nsg_name" {
  type    = string
  default = "myKKNSG001"
}

# Define Public IP variable
variable "NIC1pubipname" {
  type    = string
  default = "myKKpubip001"
}

# Define Public IP variable
variable "NIC2pubipname" {
  type    = string
  default = "myKKpubip002"
}

# Define Virtual Machine 1 variable.
variable "vm1Name" {
  type    = string
  default = "KKadminvm0021"
}

# Define Virtual Machine 2 variable.
variable "vm2Name" {
  type    = string
  default = "KKuservm0021"
}

# Define Virtual Machine 1 Network Interface Card (NIC) variable.
variable "nic1" {
  type    = string
  default = "myfsKKtNIC01"
}

# Define Virtual Machine 2 Network Interface Card (NIC) variable.
variable "nic2" {
  type    = string
  default = "mysecKKNIC02"
}

# Define Virtual Machine 1 Credentials.
variable "admin_name" {
  type    = string
  default = "kkadmin"
}
variable "admin_password" {
  type    = string
  default = "PAssword456r"
}

# Define Virtual Machine 2 Credentials.
variable "user_name" {
  type    = string
  default = "kkusers"
}
variable "user_password" {
  type    = string
  default = "Ynae25iasdfas"
}