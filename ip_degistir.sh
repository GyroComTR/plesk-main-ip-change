#!/bin/bash

echo "Scripti kullanmadan önce yedek alınız. Take backup before using this script."

# Kullanıcıdan gerekli bilgileri alın / Get necessary information from the user
read -p "Eski IP adresini girin / Enter the old IP address: " ESKI_IP
read -p "Eski IP için CIDR değeri girin (örn: 16, 24 veya 32) / Enter CIDR value for the old IP (e.g., 16, 24, or 32): " ESKI_CIDR
read -p "Yeni IP adresini girin / Enter the new IP address: " YENI_IP
read -p "Yeni IP için CIDR değeri girin (örn: 24 veya 32) / Enter CIDR value for the new IP (e.g., 24 or 32): " YENI_CIDR
read -p "Subnet maskesini girin (örn: 255.255.255.0) / Enter the subnet mask (e.g., 255.255.255.0): " SUBNET_MASK
read -p "Ağ arayüzünü girin (örn: ens192) / Enter the network interface (e.g., ens192): " INTERFACE

# 1. Adım: Yeni IP'yi Plesk'e shared olarak ekleyin / Step 1: Add the new IP as shared in Plesk
echo "Yeni IP adresi Plesk'e shared olarak ekleniyor... / Adding new IP address to Plesk as shared..."
plesk bin ipmanage --create $YENI_IP -type shared -mask $SUBNET_MASK -interface "$INTERFACE"

# 2. Adım: Tüm siteleri yeni IP adresine taşıyın / Step 2: Move all sites to the new IP address
echo "Tüm siteler yeni IP adresine taşınıyor... / Moving all sites to the new IP address..."
plesk bin ipmanage --remap <<EOF
$ESKI_IP -> $YENI_IP
EOF

# 3. Adım: Eski IP adresini sunucudan kaldırın / Step 3: Remove the old IP address from the server
echo "Eski IP adresi sunucudan kaldırılıyor... / Removing the old IP address from the server..."
ip addr del $ESKI_IP/$ESKI_CIDR dev $INTERFACE

# 4. Adım: Yeni IP adresini sunucuya ekleyin / Step 4: Add the new IP address to the server
echo "Yeni IP adresi sunucuya ekleniyor... / Adding the new IP address to the server..."
ip addr add $YENI_IP/$YENI_CIDR dev $INTERFACE

# 5. Adım: Ağ geçidini ayarlayın / Step 5: Set up the network gateway
SUBNET="${YENI_IP%.*}.1"
echo "Ağ geçidi ayarlanıyor... / Setting up the gateway..."
ip route add default via $SUBNET dev $INTERFACE

# 6. Adım: Tüm IP ayarlarını otomatik remap ile güncelleyin / Step 6: Update all IP settings with auto remap
echo "Tüm IP adresleri otomatik remap ile güncelleniyor... / Updating all IP addresses with auto remap..."
plesk bin ipmanage --auto-remap -drop-if-exists

# 7. Adım: Eski IP adresini Plesk'ten kaldırın / Step 7: Remove the old IP address from Plesk
echo "Eski IP adresi Plesk'ten kaldırılıyor... / Removing the old IP address from Plesk..."
plesk bin ipmanage --remove $ESKI_IP

echo "İşlem tamamlandı. Sunucudaki tüm IP adresleri ve Plesk yapılandırması yeni IP adresi ile güncellenmiştir. / Process completed. All IP addresses and Plesk configuration on the server have been updated with the new IP address."
