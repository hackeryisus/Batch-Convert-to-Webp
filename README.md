# Batch-Convert-to-Webp
Bash Script to convert a png or jpg to webp


We’ll be using Google WebP Codec for this. To install it through terminal, follow below mentioned procedure:

On Linux (Ubuntu):
sudo apt-get install webp

On MacOS:
brew install webp


On Windows:
choco install webp

Make sure you have installed chocolaty package manager. To install just chocolaty just run following command in powershell (run as administrator):
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


Once installed webp run the script open a terminal on the folder where the script was downloaded and run the script

sh webpconverter.sh

The script will ask you for the path to the folder where your images are located so copy and paste and press enter.
