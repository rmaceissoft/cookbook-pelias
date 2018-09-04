#
# Cookbook Name:: pelias
# Recipe:: interpolation
#

git node[:pelias][:interpolation][:deploy_to] do
  action :sync
  user node[:pelias][:user][:name]
  repository node[:pelias][:interpolation][:repository]
  revision node[:pelias][:interpolation][:revision]
end

directory node[:pelias][:interpolation][:data_dir] do
  recursive true
  owner node[:pelias][:user][:name]
  mode 0755
end

execute 'npm install interpolation' do
  user node[:pelias][:user][:name]
  cwd  node[:pelias][:interpolation][:deploy_to]
  command 'npm install'
  environment('HOME' => node[:pelias][:user][:home])
end


