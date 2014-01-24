
var exec = require('child_process').exec

return module.exports = {
  create: create
}

function create() {
  return {
    lookup: lookup
  }

  function lookup(ip, done) {
    var options = { timeout: 10000 }
    exec('geoiplookup ' + ip, options, function(err, stdout, stderr) {
      if (err) return done(new Error(err + ' ' + stdout + ' ' + stderr))
      if (ipWasNotFound(stdout)) return done()

      /* geoiplookup prints something like: "GeoIP Country Edition: GB, United Kingdom" */
      var values = stdout.replace('GeoIP Country Edition: ', '')
        .split(',')
        .map(function(value) { return value.trim() })
      var countryCode = values[0]
      var country = values[1]
      if (!country || !countryCode) return done()

      return done(null, {
        country: country,
        countryCode: countryCode
      })
    })
  }
}

function ipWasNotFound(geoiplookupOutput) {
  /* if no location was found, geoiplookup prints: "GeoIP Country Edition: IP Address not found" */
  return !geoiplookupOutput || (geoiplookupOutput.indexOf('not found') > 0)
}