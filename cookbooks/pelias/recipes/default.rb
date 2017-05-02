#
# Cookbook Name:: pelias
# Recipe:: default
#

%w(
  setup
  config
  api
  schema
  whosonfirst
  openaddresses
  geonames
).each do |r|
  include_recipe "pelias::#{r}"
end
