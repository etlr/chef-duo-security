#
# Cookbook Name:: duo-security
# Author:: Eli Taylor
# Description:: This recipe will install login_duo from source.
# Recipe:: default
#
# Copyright 2013-2014, KickBack Points, LLC
#
# All rights reserved - Do Not Redistribute
#

include_recipe "build-essential"

if platform?("ubuntu", "debian")
  # this recipe does not work on Ubuntu 9.04
  return if node.platform_version == '9.04'

  %w{libssl-dev libpam-dev}.each do |pkg|
    package pkg do
      action :install
    end
  end
elsif platform?("redhat", "centos", "scientific", "fedora", "suse", "arch", "freebsd")
  %w{gcc make openssl-devel python-devel pam-devel}.each do |pkg|
    package pkg do
      action :install
    end
  end
end

duo_unix_version = node['duosecurity']['duo_unix']['version']

remote_file "#{Chef::Config[:file_cache_path]}/duo_unix-#{duo_unix_version}.tar.gz" do
  source "#{node['duosecurity']['duo_unix']['url']}/duo_unix-#{duo_unix_version}.tar.gz"
  checksum node['duosecurity']['duo_unix']['checksum']
  action :create_if_missing
end

bash "compile-duo_unix" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxvf duo_unix-#{duo_unix_version}.tar.gz
    cd duo_unix-#{duo_unix_version}
    ./configure --prefix=/usr && make && make install
  EOH
  creates "#{Chef::Config[:file_cache_path]}/duo_unix-#{duo_unix_version}"
end

template "#{node['duosecurity']['config_dir']}/login_duo.conf" do
  source 'login_duo.conf.erb'
  notifies :restart, 'service[ssh]'
end
