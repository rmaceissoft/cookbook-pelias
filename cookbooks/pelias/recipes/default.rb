#
# Cookbook Name:: pelias
# Recipe:: default
#

%w(
  setup
  config
  libpostal
  api
  schema
  whosonfirst
  openaddresses
  geonames
  osm
  gtfs
  nginx
).each do |r|
  include_recipe "pelias::#{r}"
end
