#
# Cookbook Name:: pelias
# Recipe:: whosonfirst
#

deploy "#{node[:pelias][:basedir]}/whosonfirst" do
  user        node[:pelias][:user][:name]
  repository  node[:pelias][:whosonfirst][:repository]
  revision    node[:pelias][:whosonfirst][:revision]
  migrate     false

  symlink_before_migrate.clear

  notifies :run, 'execute[npm install whosonfirst]', :immediately
  only_if { node[:pelias][:whosonfirst][:index_data] == true }
end

execute 'npm install whosonfirst' do
  action  :nothing
  user    node[:pelias][:user][:name]
  command 'npm install'
  cwd     "#{node[:pelias][:basedir]}/whosonfirst/current"
  environment('HOME' => node[:pelias][:user][:home])
  notifies :run, 'execute[download whosonfirst data]', :immediately
end

execute 'download whosonfirst data' do
  action  :nothing
  user    node[:pelias][:user][:name]
  command 'npm run download'
  cwd     "#{node[:pelias][:basedir]}/whosonfirst/current"
  environment(
    'HOME' => node[:pelias][:user][:home],
    'PELIAS_CONFIG' => "#{node[:pelias][:cfg_dir]}/#{node[:pelias][:cfg_file]}"
  )
end
