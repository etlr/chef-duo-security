#Default integration settings.
default['duosecurity']['ikey'] = ''
default['duosecurity']['skey'] = ''
default['duosecurity']['host'] = ''

#This attribute is read by the sshd_config template in the openssh cookbook.
default['openssh']['server']['force_command'] = "/usr/sbin/login_duo"

default['duosecurity']['duo_unix']['url'] = "https://dl.duosecurity.com"
default['duosecurity']['duo_unix']['version'] = "1.9.5"
default['duosecurity']['duo_unix']['checksum'] = "e57793f5c301feb6e7960fdf70af7411e9503276"

#Longin_duo.conf Config dir.
default['duosecurity']['config_dir'] = "/etc/duo"

