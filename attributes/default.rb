#Default integration settings.
default['duosecurity']['ikey'] = ''
default['duosecurity']['skey'] = ''
default['duosecurity']['host'] = ''

#This attribute is read by the sshd_config template in the openssh cookbook.
default['openssh']['server']['force_command'] = "/usr/sbin/login_duo"

default['duosecurity']['duo_unix']['url'] = "https://dl.duosecurity.com"
default['duosecurity']['duo_unix']['version'] = "1.9.4"
default['duosecurity']['duo_unix']['checksum'] = "bc8cd9c9a4774a4f85e76453488b8e12c5681fd1"

#Longin_duo.conf Config dir based on OS.
if platform?("ubuntu", "debian")
  default['duosecurity']['config_dir'] = "/etc/duo"
elsif platform?("redhat", "centos",  "fedora")
  default['duosecurity']['config_dir'] = "/etc/security"
end

