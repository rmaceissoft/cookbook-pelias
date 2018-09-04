#
# Cookbook Name:: pelias
# Recipe:: libpostal
#

include_recipe 'apt::default'

# libpostal prerequisites
package 'curl'
package 'autoconf'
package 'automake'
package 'libtool'
package 'pkg-config'

git node[:pelias][:libpostal][:deploy_to] do
  action      :sync
  user        node[:pelias][:user][:name]
  repository  node[:pelias][:libpostal][:repository]
  revision    node[:pelias][:libpostal][:revision]
end

# libpostal
directory node[:pelias][:libpostal][:data_dir] do
  recursive true
  owner     node[:pelias][:user][:name]
  mode      0755
end

execute "libpostal build" do
  user node[:pelias][:user][:name]
  cwd node[:pelias][:libpostal][:deploy_to]
  command <<-EOF
    ./bootstrap.sh
    ./configure --datadir=#{node[:pelias][:libpostal][:data_dir]}
    make -j4
    EOF
end

execute "libpostal install" do
  user 'root'
  cwd node[:pelias][:libpostal][:deploy_to]
  command <<-EOF
    make install
    ldconfig
    EOF
end


git node[:pelias][:go_whosonfirst_libpostal][:deploy_to] do
  action      :sync
  user        node[:pelias][:user][:name]
  repository  node[:pelias][:go_whosonfirst_libpostal][:repository]
  revision    node[:pelias][:go_whosonfirst_libpostal][:revision]
end

include_recipe 'runit::default'

runit_service 'pelias-libpostal' do
  action [:enable, :start]
  log true
  default_logger true
  sv_timeout 60
end
