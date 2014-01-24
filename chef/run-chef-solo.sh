CONFIG=/media/geoip/chef/config/$CHEFENV.rb
sudo chef-solo -c $CONFIG -o "role[geo-ip-service]"
