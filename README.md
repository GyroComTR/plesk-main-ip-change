# plesk-main-ip-change
This script updates the old IP address on a server with a new one by configuring both the Plesk panel and server network settings. It first adds the new IP to Plesk, transfers all sites to the new IP, removes the old IP, and configures the server settings to operate with the new IP.

# IP Adresi Değiştirme Betiği Kullanım Kılavuzu
# IP Address Change Script Usage Guide

Bu betik, sunucunuzdaki eski bir IP adresini yenisiyle değiştirmek için kullanılır.
This script is used to replace an old IP address on your server with a new one.

## Gereksinimler
## Requirements

- Plesk yönetim paneli yüklü bir sunucu.
- A server with Plesk management panel installed.

- Root veya sudo yetkisine sahip olmalısınız.
- You must have root or sudo privileges.

## Adım Adım Kullanım
## Step-by-Step Usage

### 1. Betik Dosyasını Oluşturun
### 1. Create the Script File

Betik içeriğini bir metin dosyasına kopyalayın ve `ip_degistir.sh` olarak kaydedin.
Copy the script content into a text file and save it as `ip_change.sh`.

### 2. Betiğe Çalıştırma İzni Verin
### 2. Grant Execute Permission to the Script

Terminalde aşağıdaki komutu çalıştırın:
Run the following command in the terminal:

```bash
chmod +x ip_degistir.sh
```

### 3. Betiği Çalıştırın
### 3. Run the Script

Betiği aşağıdaki komutla çalıştırın:
Run the script with the following command:

```bash
sudo ./ip_degistir.sh
```

### 4. Gerekli Bilgileri Girin
### 4. Enter the Required Information

Betiğin istemiş olduğu bilgileri girin:
Provide the information requested by the script:

- **Eski IP adresi**: Sunucunuzdaki mevcut IP adresi.
  - **Old IP address**: The current IP address on your server.

- **Yeni IP adresi**: Değiştirmek istediğiniz yeni IP adresi.
  - **New IP address**: The new IP address you want to switch to.

- **Subnet maskesi**: Ağınızın alt ağ maskesi (örn: 255.255.255.0).
  - **Subnet mask**: The subnet mask of your network (e.g., 255.255.255.0).

- **Ağ arayüzü**: Sunucunuzun ağ arayüzü adı (örn: ens192).
  - **Network interface**: The name of your server's network interface (e.g., ens192).

### 5. Betiğin İşlemleri Gerçekleştirmesini Bekleyin
### 5. Wait for the Script to Complete its Operations

Betik aşağıdaki adımları otomatik olarak gerçekleştirecektir:
The script will automatically perform the following steps:

1. **Yeni IP adresini Plesk'e shared olarak ekler.**
   1. **Adds the new IP address to Plesk as shared.**

2. **Tüm siteleri yeni IP adresine taşır.**
   2. **Moves all websites to the new IP address.**

3. **Eski IP adresini sunucudan kaldırır.**
   3. **Removes the old IP address from the server.**

4. **Yeni IP adresini sunucuya ekler.**
   4. **Adds the new IP address to the server.**

5. **Ağ geçidini ayarlar.**
   5. **Sets up the network gateway.**

6. **Tüm IP ayarlarını otomatik remap ile günceller.**
   6. **Updates all IP settings using auto-remap.**

7. **Eski IP adresini Plesk'ten kaldırır.**
   7. **Removes the old IP address from Plesk.**

### 6. İşlemin Tamamlandığını Kontrol Edin
### 6. Verify the Process Completion

Betiğin sonunda "İşlem tamamlandı..." mesajını gördüğünüzde işlemler başarıyla tamamlanmıştır.
When you see the "Process completed..." message, the operations have been successfully finished.

## Önemli Notlar
## Important Notes

- **Yedek Alın**: İşleme başlamadan önce sunucunuzun yedeğini almanız önerilir.
  - **Backup**: It is recommended to back up your server before starting the process.

- **Doğru Bilgileri Girin**: Yanlış bilgi girişi sunucunuzda ağ sorunlarına yol açabilir.
  - **Enter Correct Information**: Incorrect input may cause network issues on your server.

- **Ağ Arayüzü Adı**: Ağ arayüzü adınızı öğrenmek için `ip addr` komutunu kullanabilirsiniz.
  - **Network Interface Name**: You can use `ip addr` command to find out your network interface name.

## Sorun Giderme
## Troubleshooting

- **İzin Hatası**: Betiği çalıştırırken izin hatası alırsanız `sudo` ile çalıştırmayı deneyin.
  - **Permission Error**: If you get a permission error, try running the script with `sudo`.

- **Ağ Bağlantısı**: İşlem sonrası bağlantı sorunları yaşıyorsanız ağ ayarlarınızı kontrol edin.
  - **Network Connectivity**: If you face connectivity issues after the process, check your network settings.

- **Plesk Erişimi**: Plesk paneline erişimde sorun yaşarsanız, yeni IP adresiyle erişmeyi deneyin.
  - **Plesk Access**: If you have issues accessing Plesk, try using the new IP address.

## Örnek Kullanım
## Example Usage

```bash
sudo ./ip_degistir.sh
```

```plaintext
Eski IP adresini girin: 192.168.1.100
Yeni IP adresini girin: 192.168.1.200
Subnet maskesini girin (örn: 255.255.255.0): 255.255.255.0
Ağ arayüzünü girin (örn: ens192): ens192
```

## Destek
## Support

Sorularınız için sistem yöneticinize başvurun.
For any questions, please contact your system administrator.

# License

Bu betik MIT lisansı altında lisanslanmıştır.
This script is licensed under the MIT license.

# Footnotes

Bu kılavuz, sunucunuzdaki IP adresini güvenli ve etkili bir şekilde değiştirmek için adım adım talimatlar sağlar.
This guide provides step-by-step instructions to safely and effectively change the IP address on your server.
