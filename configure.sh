git submodule update --init
(cd chef/local-cookbooks/geo-ip-service/files/default/geo-ip-service/node && npm install)
(cd chef && librarian-chef install)
