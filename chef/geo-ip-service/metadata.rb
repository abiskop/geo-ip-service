name             'geo-ip-service'
maintainer       'Alexander Biskop'
maintainer_email 'biskop@stocard.de'
#license          'TODO'
description      'Installs node, configures geo-ip-service as an upstart service and sets up a cron job to download GeoLite Land DB.'
version          '0.0.1'
provides         "geo-ip-service"

recipe "geo-ip-service", "Installs node, configures geo-ip-service as an upstart service and sets up a cron job to download GeoLite Land DB."

depends "nodejs"
