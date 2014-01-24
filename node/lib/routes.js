
var restify = require('restify')
var url = require('url')
var validate = require('./validate')

return module.exports = {
  create: create
}

function create(service, config) {
  var doLookup = require('./lookup').create(config.geoiplookup_cli).lookup

  service.get('/', getIndex)
  service.get('/lookup', getLookup)

  function getIndex(req, res, next) {
    res.send({
      status: 'ok',
      urls: {
        lookup: {
          method: 'GET',
          url: url.resolve(config.service.publicBaseUrl, '/lookup?ip={ip}')
        }
      }
    })
    return next()
  }

  function getLookup(req, res, next) {
    var ip = req.query.ip
    if (!ip) return next(new restify.BadRequestError())
    if (!validate.that(ip).isAnIpAddress()) return next(new restify.BadRequestError())

    doLookup(ip, function(err, location) {
      if (err) {
        log.error(err)
        return next(new restify.InternalServerError())
      }
      if (!location) return next(new restify.NotFoundError())

      res.send({ location: location })
      return next()
    })
  }
}
