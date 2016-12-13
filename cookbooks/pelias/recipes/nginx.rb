#
# Cookbook Name:: pelias
# Recipe:: nginx
#

include_recipe 'nginx'


# -----
# pelias.metroservices.io
# -----

# Build Nginx conf file
template "/etc/nginx/sites-available/pelias" do
  source "pelias-nginx.conf.erb"
  owner "root"
  group "root"
  mode 00644
  action :create
  notifies :restart, "service[nginx]", :delayed
end

# Symlink the conf file
link "/etc/nginx/sites-enabled/pelias" do
  to "/etc/nginx/sites-available/pelias"
  owner "root"
  group "root"
  action :create
end
