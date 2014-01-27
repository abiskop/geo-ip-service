git submodule update --init
(cd chef/geo-ip-service/files/default/geo-ip-service/node && npm install)
(cd vagrant && librarian-chef install)
