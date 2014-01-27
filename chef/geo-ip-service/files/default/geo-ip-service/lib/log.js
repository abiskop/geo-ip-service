
var bunyan = require('bunyan')

return module.exports = createLogger()

function createLogger() {
  return bunyan.createLogger({
    name: 'geo-ip-service',
    streams: [
      {
        level: 'info',
        stream: process.stdout,
      }
    ],
    serializers: bunyan.stdSerializers
  })
}

