# Jax South Configs

az 

sleep 2

# Define Jax South variables.
resourceGroup="Ank_Solutions_Ink_RG"
JaxSouthlocation="southcentralus"
JaxSouthVnet="JaxSouthVnet00121"
JaxSouthSubnet="JaxSouthSnet002"
JaxNSG="JaxNSG001"
JaxSouthVM="jaxsouthusers"
JaxSimage="Win2019Datacenter"
JaxSouthNIC="JaxSouthNIC002"


# Create a Jax South virtual network, Lay it out for viewing without scrolling. Had to change my ip from 10.0.1.0/16 to 10.0.0.0/16.
az network vnet create \
--resource-group $resourceGroup \
--location $JaxSouthlocation \
--name $JaxSouthVnet \
--address-prefixes 10.0.0.0/16 \
--subnet-name $JaxSouthSubnet \
--subnet-prefix 10.0.1.0/24 \
--no-wait

# Create JaxSouth subnet, Lay it out for viewing without scrolling. Removed location lets see if it takes.
az network vnet subnet create \
--resource-group $resourceGroup \
--vnet-name $JaxSouthVnet \
--name $JaxSouthSubnet \
--address-prefixes 10.0.1.0/24 \
--no-wait

# Create a network security group, Lay it out for viewing without scrolling. 
az network nsg create \
--resource-group $resourceGroup \
--name $JaxNSG \
--location $JaxSouthlocation \
--no-wait

# Create Jax South VM, Lay it out for viewing without scrolling. 
az vm create \
--resource-group $resourceGroup \
--location $JaxSouthlocation \
--name $JaxSouthVM \
--image $JaxSimage \
--admin-username usersqtech2 \
--admin-password Ynae25iasdfas \
--vnet-name $JaxSouthVnet \
--subnet $JaxSouthSubnet
--no-wait

# Create JaxSouth NIC, thena add to JaxSouth VM.
az network nic create \
    --resource-group $resourceGroup \
    --name $JaxSouthNIC \
    --vnet-name $JaxSouthVnet \
    --subnet $JaxSouthSubnet \
--no-wait 

az vm nic add \
    --resource-group $resourceGroup \
    --vm-name $JaxSouthVM \
    --nics $JaxSouthNIC
--no-wait

# Open the RDP port on the NSG
az vm open-port \
--resource-group $resourceGroup \
--name $JaxSouthVM \
--port "3389" \
--priority 110

# Associate NSG with the subnet, Lay it out for viewing without scrolling. 
az network vnet subnet update 
--resource-group $resourceGroup \
--name $JaxSouthSubnet \
--vnet-name $JaxSouthVnet \
--network-security-group $JaxNSG \
--no-wait

