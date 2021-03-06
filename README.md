geo-ip-service
==============

A simple node.js service that performs a geo-lookup on IP addresses using the [geoiplookup](http://manpages.ubuntu.com/manpages/hardy/man1/geoiplookup.1.html) command line tool and the free [GeoLite Country Database](http://dev.maxmind.com/geoip/legacy/geolite/).

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

Make/install cookbooks:
```
bash make-cookbook.sh
(cd vagrant && librarian-chef install)
```
Start the Vagrant box:
```
(cd vagrant && vagrant destroy -f && vagrant up)
```

Run tests against the Vagrant box:
```
npm test
```

When making changes to the source code, run `bash make-cookbook.sh && (cd vagrant && vagrant provision)` in order to re-provision the box before re-running tests via `npm test`.


###License
This product includes GeoLite data created by MaxMind, available from http://www.maxmind.com.
