include_recipe "nodejs"

package "geoip-bin" do
  action :upgrade
end

package "geoip-database" do
  action :upgrade
end

user "geoip" do
  system true
end

directory node["geo-ip-service"]["install-dir"] do
  owner "geoip"
  group "geoip"
end

directory node["geo-ip-service"]["log-dir"] do
  owner "geoip"
  group "geoip"
end

remote_directory "copy_to_install_dir" do
  path node["geo-ip-service"]["install-dir"]
  source "geo-ip-service/node"
end