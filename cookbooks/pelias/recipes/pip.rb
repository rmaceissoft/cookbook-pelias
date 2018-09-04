#
# Cookbook Name:: pelias
# Recipe:: pip
#

git node[:pelias][:pip][:deploy_to] do
  action :sync
  user node[:pelias][:user][:name]
  repository node[:pelias][:pip][:repository]
  revision node[:pelias][:pip][:revision]
  notifies :run, 'execute[npm install pip]',  :immediately
  notifies :restart, 'runit_service[pelias-pip]', :delayed
end

execute 'npm install pip' do
  action :nothing
  user node[:pelias][:user][:name]
  cwd  node[:pelias][:pip][:deploy_to]
  command 'npm install'
  environment('HOME' => node[:pelias][:user][:home])
end

include_recipe 'runit::default'

runit_service 'pelias-pip' do
  action [:enable, :start]
  log true
  default_logger  true
  sv_timeout 60
  env(
    'PELIAS_CONFIG' => "#{node[:pelias][:cfg_dir]}/#{node[:pelias][:cfg_file]}",
    'PORT' => "#{node[:pelias][:pip][:port]}"
  )
end


