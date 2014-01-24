geo-ip-service
==============

A simple service that performs a geo-lookup on IP addresses using the [geoiplookup](http://manpages.ubuntu.com/manpages/hardy/man1/geoiplookup.1.html) command line tool and the free [GeoLite Land Database](http://dev.maxmind.com/geoip/legacy/geolite/).

##Documentation


###Routes

####`GET /`
Returns
- `HTTP 200 OK` with status information if service is running

####`GET /lookup?ip={ip}`
Expects
- `ip` query parameter: an IP address

Returns
- `HTTP 200 OK` with JSON response body, if lookup was successful:

  ``` js
  {
    "countryCode": "GB",
    "country": "United Kingdom"
  }
  ```
- `HTTP 404 Not Found` if no location could be found for the given IP address
- `HTTP 400 Bad Request` if a malformed or no IP address was given


###Running Tests
Requirements:
- a VM provider, preferrably VirtualBox
  -- tested with VirtualBox v4.1, Guest Additions v4.2.0
- vagrant 
- vagrant-omnibus
- librarian-chef

Install cookbooks and start the Vagrant box:
```
(cd chef && librarian-chef install)
(cd vagrant && vagrant destroy -f && vagrant up)
```

Run tests:
```
(cd vagrant && vagrant ssh -c "cd /media/geoip && npm test")
```

*Or*, if you do not want to run the Vagrant box, run tests on your machine instead.
Go to `cd node`, run the service locally via `node lib/index.js | node_modules/.bin/bunyan` and run tests via `npm test`.


###License
This product includes GeoLite data created by MaxMind, available from http://www.maxmind.com.
