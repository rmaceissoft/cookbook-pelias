#
# Cookbook Name:: pelias
# Recipe:: placeholder
#

git node[:pelias][:placeholder][:deploy_to] do
  action :sync
  user node[:pelias][:user][:name]
  repository node[:pelias][:placeholder][:repository]
  revision node[:pelias][:placeholder][:revision]
  notifies :run, 'execute[npm install placeholder]',  :immediately
  notifies :restart, 'runit_service[pelias-placeholder]', :delayed
end

execute 'npm install placeholder' do
  action :nothing
  user node[:pelias][:user][:name]
  cwd  node[:pelias][:placeholder][:deploy_to]
  command 'npm install'
  environment('HOME' => node[:pelias][:user][:home])
  notifies :run, 'execute[download placeholder data]',  :immediately
end

execute "download placeholder data" do
  action :nothing
  user node[:pelias][:user][:name]
  group node[:pelias][:user][:name]
  cwd node[:pelias][:placeholder][:deploy_to]
  command <<-EOF
    mkdir -m 0755 data
    curl -s https://s3.amazonaws.com/pelias-data.nextzen.org/placeholder/store.sqlite3.gz | gunzip > data/store.sqlite3;
    EOF
end

include_recipe 'runit::default'

runit_service 'pelias-placeholder' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      60
  env(
    'PELIAS_CONFIG' => "#{node[:pelias][:cfg_dir]}/#{node[:pelias][:cfg_file]}",
    'PORT'          => "#{node[:pelias][:placeholder][:port]}"
  )
end


