cron "update_geoip_database" do
  ## TODO: interval should be configurable
  minute "0"
  hour "1"
  weekday "3" ## wednesday
  user "root"
  mailto node["geo-ip-service"]["cron-mailto"]
  ## dirty: hardcoded use of apt-get to upgrade package
  command "apt-get update && apt-get install --only-upgrade geoip-database"
end