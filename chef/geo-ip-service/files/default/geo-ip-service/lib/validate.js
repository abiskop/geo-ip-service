
var ipAddressRegex = /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/

return module.exports = {
  that: that
}

function that(validatee) {
  return {
    isAnIpAddress: function() {
      return ipAddressRegex.test(validatee)
    }
  }
}