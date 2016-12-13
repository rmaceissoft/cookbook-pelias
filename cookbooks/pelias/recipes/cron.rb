#
# Cookbook Name:: pelias
# Recipe:: cron
#


# cron job to renew SSL certificate
cron "renew_ssl_certificate" do
  minute "0"
  hour "0"
  user "root"
  command 'certbot-auto renew --quiet --pre-hook "service nginx stop" --post-hook "service nginx start"'
end
