#
# Cookbook Name:: pelias
# Recipe:: setup
#

# dependencies
include_recipe 'apt::default'
include_recipe 'nodejs::nodejs_from_binary'


if node["environment"] == 'development'
  include_recipe 'java::default'
  include_recipe 'elasticsearch::default'

  # elastic search plugins required by pelias
  elasticsearch_plugin 'analysis-icu' do
    action :install
  end

  # need to start ES after the initial installation
  execute 'service elasticsearch start' do
    not_if 'pgrep -f elasticsearch'
  end
end


package 'git'
package 'build-essential'
package 'htop'
package 'vim'


# user
include_recipe 'pelias::user'

# base/logs
directory node[:pelias][:basedir] do
  recursive true
  mode      0755
  owner     node[:pelias][:user][:name]
end

directory "#{node[:pelias][:basedir]}/logs" do
  mode    0755
  owner   node[:pelias][:user][:name]
end

# geonames
directory node[:pelias][:geonames][:data_dir] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end

# whosonfirst
directory node[:pelias][:whosonfirst][:data_dir] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end

# osm
directory node[:pelias][:osm][:data_dir] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end

directory node[:pelias][:osm][:leveldb] do
  recursive true
  owner  node[:pelias][:user][:name]
  mode   0755
end

# address deduper
directory node[:pelias][:address_deduper][:leveldb] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end

# libpostal
directory node[:pelias][:libpostal][:data_dir] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end
