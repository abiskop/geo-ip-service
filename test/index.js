
var assert = require('assert')
var request = require('superagent')
var url = require('url')
var config = require('../conf/config.js')

describe('geo-ip-service', function() {
  describe('index', function() {
    it('should return 200 OK with lookup url when it is running', function(done) {
      request.get(makeUrl('/')).end(function(res) {
        assert.equal(res.status, 200)
        assert.ok(res.body.urls.lookup.url)
        assert.ok(res.body.urls.lookup.method)
        done()
      })
    })
  })
  describe('lookup', function() {
    it('should return 400 Bad Request if no IP address specified', function(done) {
      request.get(makeUrl('/lookup')).end(function(res) {
        assert.equal(res.status, 400)
        done()
      })
    })
    it('should return 400 Bad Request if malformed IP address specified', function(done) {
      request.get(makeUrl('/lookup?ip=asdf')).end(function(res) {
        assert.equal(res.status, 400)
        done()
      })
    })
    it('should return 404 if no location for IP address available', function(done) {
      request.get(makeUrl('/lookup?ip=127.0.0.1')).end(function(res) {
        assert.equal(res.status, 404)
        done()
      })
    })
    it('should return location if available for IP address', function(done) {
      var expectedLocation = {
        country: 'Germany',
        countryCode: 'DE'
      }
      request.get(makeUrl('/lookup?ip=80.187.101.76')).end(function(res) {
        assert.equal(res.status, 200)
        assert.deepEqual(res.body.location, expectedLocation)
        done()
      })
    })
  })
})

function makeUrl(relPath) {
  return url.resolve(config.service.publicBaseUrl, relPath)
}