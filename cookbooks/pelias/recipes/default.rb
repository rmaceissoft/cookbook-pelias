#
# Cookbook Name:: pelias
# Recipe:: default
#


include_recipe "pelias::setup"
include_recipe "pelias::config"


if node["environment"] == 'development' or node[:tags].include? 'pelias-api'
  # pelias api
  include_recipe "pelias::libpostal"
  include_recipe "pelias::api"
  include_recipe "pelias::nginx"
end

if node["environment"] == 'development' or node[:tags].include? 'pelias-importer'
  # pelias importer
  include_recipe "pelias::schema"
  include_recipe "pelias::whosonfirst"
  include_recipe "pelias::openaddresses"
  include_recipe "pelias::geonames"
  include_recipe "pelias::osm"
  include_recipe "pelias::gtfs"
end