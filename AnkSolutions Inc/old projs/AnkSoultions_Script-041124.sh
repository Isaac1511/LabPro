

az 

sleep 2

# Define variables 
resourceGroup="PartsUnlimited"
location="eastus"
vnetName="myVnet00121"
subnetName="mySnet12100"
JaxNSG="JaxNSG001"
vm1Name="JaxNorth"
vm2Name="JaxSouth"
imagename="Ubuntu2204"
nics="JaxNorthNIC"
nics2="JaxSouthNIC"


# Create a virtual network. 
az network vnet create --resource-group $resourceGroup --location $location --name $vnetName --address-prefixes 10.0.0.0/16 --subnet-name $subnetName --subnet-prefix 10.0.0.0/24 --no-wait

# Create a subnet.
az network vnet subnet create --resource-group $resourceGroup --location $location --vnet-name $vnetName --name $subnetName --address-prefixes 10.0.0.0/24 --no-wait

# Create a network security group.
az network nsg create --resource-group $resourceGroup --name $nsgName --location $location --no-wait

# Create VM 1.
az vm create --resource-group $resourceGroup --location $location --name $vm1Name --image $imagename --admin-username adminqtecmai2 --admin-password P@ssword456rV$ --vnet-name $vnetName --subnet $subnetName 

az network nic create \
    --resource-group $resourceGroup \
    --name $nics \
    --vnet-name $vnetName \
    --subnet $subnetName

az vm nic add \
    --resource-group $resourceGroup \
    --vm-name $vm1Name \
    --nics $nics

# Create VM 2.
az vm create --resource-group $resourceGroup --location $location --name $vm2Name --image $imagename --admin-username usersqtech2 --admin-password Ynae25iasdfas --vnet-name $vnetName --subnet $subnetName

az network nic create \
    --resource-group $resourceGroup \
    --name $nics2 \
    --vnet-name $vnetName \
    --subnet $subnetName

az vm nic add \
    --resource-group $resourceGroup \
    --vm-name $vm2Name \
    --nics $nics2

