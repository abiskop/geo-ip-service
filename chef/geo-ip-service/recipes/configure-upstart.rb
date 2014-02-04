template "/etc/init/geoip.conf" do
  source "geo-ip-service-upstart.erb"
  owner "root"
  group "root"
  mode 00644
  variables({
    :installdir => node["geo-ip-service"]["install-dir"],
    :logdir => node["geo-ip-service"]["log-dir"]
  })
end

service "geoip" do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :restart => true, :stop => true, :status => true
  action [:enable, :start]
  notifies :restart, "service[geoip]", :delayed
end
