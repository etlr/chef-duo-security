#Default integration settings.
default['duosecurity']['ikey'] = ''
default['duosecurity']['skey'] = ''
default['duosecurity']['host'] = ''

#This attribute is read by the sshd_config template in the openssh cookbook.
default['openssh']['server']['force_command'] = "/usr/sbin/login_duo"

default['duosecurity']['duo_unix']['url'] = "https://dl.duosecurity.com"
default['duosecurity']['duo_unix']['version'] = "1.9.11"
default['duosecurity']['duo_unix']['checksum'] = "4cb4e585b69fbc6a0a3635bc241fa22653c2f9c4"

#Longin_duo.conf Config dir.
default['duosecurity']['config_dir'] = "/etc/duo"

