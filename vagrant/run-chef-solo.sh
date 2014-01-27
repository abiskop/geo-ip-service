CONFIG=/media/geoip/vagrant/config/$CHEFENV.rb
sudo chef-solo -c $CONFIG -o "recipe[apt]","recipe[geo-ip-service]"
