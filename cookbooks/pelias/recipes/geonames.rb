#
# Cookbook Name:: pelias
# Recipe:: geonames
#

deploy "#{node[:pelias][:basedir]}/geonames" do
  user        node[:pelias][:user][:name]
  repository  node[:pelias][:geonames][:repository]
  revision    node[:pelias][:geonames][:revision]
  migrate     false

  symlink_before_migrate.clear

  notifies :run, 'execute[geonames install]', :immediately
  only_if { node[:pelias][:geonames][:index_data] == true }
end

execute 'geonames install' do
  action  :nothing
  user    node[:pelias][:user][:name]
  command 'npm install'
  cwd     "#{node[:pelias][:basedir]}/geonames/current"
  environment('HOME' => node[:pelias][:user][:home])
  notifies :run, 'execute[geonames download data]', :immediately
end

execute 'geonames download data' do
  action  :nothing
  user    node[:pelias][:user][:name]
  cwd     "#{node[:pelias][:basedir]}/geonames/current"
  command "npm run download"
  environment(
    'HOME' => node[:pelias][:user][:home],
    'PELIAS_CONFIG' => "#{node[:pelias][:cfg_dir]}/#{node[:pelias][:cfg_file]}"
  )
  notifies    :run, 'execute[geonames import data]', :immediately
end

execute 'geonames import data' do
  action  :nothing
  user    node[:pelias][:user][:name]
  cwd     "#{node[:pelias][:basedir]}/geonames/current"
  command "npm start"
  environment(
    'HOME' => node[:pelias][:user][:home],
    'PELIAS_CONFIG' => "#{node[:pelias][:cfg_dir]}/#{node[:pelias][:cfg_file]}"
  )
end

