# IoTeX Blockchain on arm board
## Installation
Tested on the following boards:
- Raspberry Pi 3 b+ (1 GB)
- Raspberry Pi 4 b (4 GB)
- Odroid N2 (4GB)

### Download latest Ubuntu for your board
#### Raspberry Pi 3 b+

[http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz](http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz)

Defult login: ubuntu / ubuntu


#### Raspberry Pi 4 b
This is currently the only (unofficial) version of Ubuntu I could find for the Raspeberry Pi 4 b

[https://github.com/TheRemote/Ubuntu-Server-raspi4-unofficial/releases/download/v12/ubuntu-18.04.3-preinstalled-server-arm64+raspi4.img.xz](https://github.com/TheRemote/Ubuntu-Server-raspi4-unofficial/releases/download/v12/ubuntu-18.04.3-preinstalled-server-arm64+raspi4.img.xz)

Defult login: ubuntu / ubuntu


#### Odroid N2

[https://wiki.odroid.com/odroid-n2/os_images/ubuntu/20190329](https://wiki.odroid.com/odroid-n2/os_images/ubuntu/20190329)

Defult login: odroid / odroid

### Download Etcher
[https://www.balena.io/etcher/](https://www.balena.io/etcher/)

And use it to flash a MicroSD card with the ubuntu image you downloaded for your board

### Login into your board
- Connect the board to your router with an ethernet cable, then power on your board. 
- Access your roter, find the mac address of your board among the connected devices, and configure your router so that it always gives the same IP address to your board mac address
- Login into your board:

Raspberry
```
ssh ubuntu@192.168.1.105
password: ubuntu
```
Odroid N2
```
ssh odroid@192.168.1.105
password: odroid
```
- If requested, update your password and login again with the new password

### Clone the scripts
```
git clone https://github.com/IoTeXLab/iotex-arm.git
```
if `git` is not installed in your Ubuntu image, install it with:
```
sudo apt install git
```
### Set the path to the scripèts folder
```
nano .profile
```
add this line at the exd of the file:
```
PATH="$PATH:~/iotex-arm/bin"
```
type `ctrl-X` and `Y` to save, then type `source .profile` to apply the change

### Install IoTeX node
I've built a Docker image for the latst IoTeX node release that is built for ARM boards. It's available at https://hub.docker.com/r/iotexlab/iotex-core-arm/tags so that anyone with an ARM board can install an IoTeX node by simply installing Docker and following the official instructions available on the IoTeX GitHub here: https://github.com/iotexproject/iotex-bootstrap#status

Anyway, I also got a script ready that will just perform all required operations, from installing docker to configure the node. Just type:

```
config_iotex_node
```
