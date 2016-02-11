CitationExtractor
=================


This is a simple web interface above
[libbmc](https://github.com/Phyks/libbmc/) and especially
[CERMINE](https://github.com/CeON/CERMINE) to extract references from a given
PDF file.


## Installation

* Clone this repository.
* Install requirements: `pip install -r requirements.txt`
* Create a config file: `cp config.py.example config.py` and edit it according
  to your needs.
* Run it: `python3 ./main.py`. Head to `http://localhost:8080` to see it live.

With the default configuration, it will forward uploaded papers to CERMINE
API, which is really slow and puts a lot of charge on these servers. You
should download an executable JAR from [their
repo](http://maven.icm.edu.pl/artifactory/simple/kdd-releases/pl/edu/icm/cermine/cermine-impl/)
to your server and indicate the path to this JAR file in the `config.py` file.


## LICENSE

This repo is under an MIT license.
