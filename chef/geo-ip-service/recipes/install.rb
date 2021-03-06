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
  owner "root"
  group "root"
  mode 00775
end

directory node["geo-ip-service"]["log-dir"] do
  owner "geoip"
  group "geoip"
end

remote_directory "copy_to_install_dir" do
  recursive true
  path node["geo-ip-service"]["install-dir"]
  source "geo-ip-service"
  files_owner "root"
  files_group "root"
  files_mode 00775
end

template "config.js" do
  path node["geo-ip-service"]["install-dir"] + "/conf/config.js"
  source "config.js.erb"
  owner "root"
  group "root"
  mode 00775
  variables({
    :port => node["geo-ip-service"]["port"],
    :publicBaseUrl => node["geo-ip-service"]["public-base-url"]
  })
  notifies :restart, "service[geoip]", :delayed
end
