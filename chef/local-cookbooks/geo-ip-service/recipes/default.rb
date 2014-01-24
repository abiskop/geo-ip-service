include_recipe "geo-ip-service::install"
include_recipe "geo-ip-service::configure-db-cron-job"
include_recipe "geo-ip-service::configure-upstart"