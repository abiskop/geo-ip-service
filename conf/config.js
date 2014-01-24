
return module.exports = {
  service: {
    port: 7000,
    publicBaseUrl: 'http://localhost:7000',
  },
  geoiplookup_cli: {
    // TODO: this should be something like "geoiplookup -f somefile" once DB file is set up via cron/wget
    command: 'geoiplookup '
  }
}