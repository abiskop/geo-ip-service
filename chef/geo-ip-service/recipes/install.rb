include_recipe "nodejs"

remote_directory "copy_to_install_dir" do
  path node["geo-ip-service"]["install-dir"]
  source "geoip"
end