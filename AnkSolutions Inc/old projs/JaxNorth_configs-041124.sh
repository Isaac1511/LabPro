
# Jax North Configs

az 

sleep 2


# Define Jax North variables.
resourceGroup="Ank_Solutions_Ink_RG"
JaxNorthlocation="eastus"
JaxStorage="jaxSto002"
JaxNorthVnet="JaxNorthVnet00121"
JaxNorthSubnet="JaxNorthSnet"
JaxNSG="JaxNSG001"
JaxNorthVM="jaxnorthadmins"
JaxNimage="Ubuntu2204"
JaxNorthNIC="JaxNorthNIC"


# Create Account storage. 
az storage account create \
    --resource-group $resourceGroup \
    --name $JaxSouthStorage \
    --location $JaxSouthlocation \
    --sku "Standard_LRS"


# Create a Resource group.
az group create \
    --name $resourceGroup \
    --location $JaxNorthlocation


# Create a virtual network, Lay it out for viewing without scrolling. 
az network vnet create \
--resource-group $resourceGroup \
--location $JaxNorthlocation \
--name $JaxNorthVnet \
--address-prefixes 10.0.0.0/16 \
--subnet-name $JaxNorthSubnet \
--subnet-prefix 10.0.0.0/24 \
--no-wait


# Create JaxNorth subnet, Lay it out for viewing without scrolling. Wasn not allowing me to add a location so i removed it from these lines of code.
az network vnet subnet create \
--resource-group $resourceGroup \
--vnet-name $JaxNorthVnet \
--name $JaxNorthSubnet \
--address-prefixes 10.0.0.0/24 \
--no-wait


# Create a network security group, Lay it out for viewing without scrolling. 
az network nsg create \
--resource-group $resourceGroup \
--name $JaxNSG \
--location $JaxNorthlocation \
--no-wait


# Create Jax North VM , Lay it out for viewing without scrolling. 
az vm create \
--resource-group $resourceGroup \
--location $JaxNorthlocation \
--name $JaxNorthVM \
--image $JaxNimage \
--admin-username adminqtecmai2 \
--admin-password P@ssword456rV \
--vnet-name $JaxNorthVnet \
--subnet $JaxNorthSubnet \
--no-wait


#Create JaxNorth NIC, thena add to JaxNorth VM.
az network nic create \
    --resource-group $resourceGroup \
    --name $JaxNorthNIC \
    --vnet-name $JaxNorthVnet \
    --subnet $JaxNorthSubnet


az vm nic add \
    --resource-group $resourceGroup \
    --vm-name $JaxNorthVM \
    --nics $JaxNorthNIC

# Open the RDP port on the NSG.
az vm open-port \
--resource-group $resourceGroup \
--name $JaxNorthVM \
--port "3389" \
--priority 110

# Associate NSG with the subnet, Lay it out for viewing without scrolling. 
az network vnet subnet update 
--resource-group $resourceGroup \
--name $JaxNorthSubnet \
--vnet-name $JaxNorthVnet \
--network-security-group $JaxNSG \
--no-wait

# Add inbound rule, Lay it out for viewing without scrolling. 
az network nsg rule create \
--resource-group $resourceGroup \
--nsg-name $JaxNSG \
--name AllowRDPInbound \
--priority 110 \
--protocol "TCP" \
--direction Inbound \
--source-address-prefix "10.0.1.0/24" \
--source-port-range "*" \
--destination-address-prefix "10.0.1.0/24" \
--destination-port-range "3389" \
--access Allow \
--description "Allow RDP access" \
--no-wait

# Add outbound rule, Lay it out for viewing without scrolling. 
az network nsg rule create \
--resource-group $resourceGroup \
--nsg-name $JaxNSG \
--name AllowAllOutbound \
--priority 100 \
--protocol "TCP" \
--direction Outbound \
--source-address-prefix "10.0.1.0/24" \
--source-port-range "*" \
--destination-address-prefix "10.0.1.0/24" \
--destination-port-range "3389" \
--access Allow \
--description "Allow RDP outbound traffic" \
--no-wait

# Add outbound rule, Lay it out for viewing without scrolling. 
az network nsg rule create \
--resource-group $resourceGroup \
--nsg-name $JaxNSG \
--name DenyAllOutbound \
--priority 101 \
--protocol "TCP" \
--direction Outbound \
--source-address-prefix "*" \
--source-port-range "*" \
--destination-address-prefix "*" \
--destination-port-range "*" \
--access Deny \
--description "Deny all outside outbound traffic" \
--no-wait

