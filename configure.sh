git submodule update --init
(cd chef/geo-ip-service/files/default/geo-ip-service && npm install)
(cd vagrant && librarian-chef install)
