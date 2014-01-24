template "/etc/init/geoip.conf" do
  source "geo-ip-service-upstart.erb"
  owner 'root'
  group 'root'
  mode 00644
  variables({
    :installdir => node["geo-ip-service"]["install-dir"],
    :logdir => node["geo-ip-service"]["log-dir"]
  })
  notifies :restart, "service[geoip]", :delayed
end

service "geoip" do
  action [:enable, :start]
end