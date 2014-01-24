template "/etc/init.d/geoip.conf" do
  source "geo-ip-service-upstart.erb"
  owner 'root'
  group 'root'
  mode 00644
  variables({
    :installdir => nodes["geo-ip-service"]["install-dir"],
    :logdir => nodes["geo-ip-service"]["log-dir"]
  })
  notifies :restart, "service[geoip]", :delayed
end