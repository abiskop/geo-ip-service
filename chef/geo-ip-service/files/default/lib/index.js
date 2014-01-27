
var restify = require('restify')
var config = require('../conf/config.js')
var log = require('./log')

var service = restify.createServer({
  log: log
})

service.use(restify.requestLogger())
service.use(restify.queryParser())
service.use(restify.bodyParser())

require('./routes').create(service, config)

service.on('after', restify.auditLogger({
  log: log
}))

service.listen(config.service.port, function() {
  log.info('%s listening at %s', service.name, service.url)
})