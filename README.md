docker-mt-base
==============

Docker files for building environment of Movable Type. This does not contain Movable Type.

### usage

* `cd (cgi|cgi-dev|psgi)`
* copy movable type files to ./movabletype/ directory
* `docker-compose up`
* `open http://localhost:8080/mt/mt.cgi`
