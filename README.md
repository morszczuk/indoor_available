# indoor_available

### Description
This project aims to standard way of creating Wayfrind communicates (https://www.wayfindr.net/) based on the provided XML route. Route has to be specified using IndoorGML (more: http://www.indoorgml.net/).  

### Usage
To see example usage, in main directory run command:

```
./scripts/test_parse_xml.rb route_filepath
```

It will parse XML file and output the list of Wayfindr communicates (EDIT: currently, it only generates graph presentation of route nodes). 

### Details
Project is a continuation of a hackathon app, (described here:https://techcrunch.com/2018/02/02/polish-hackers-create-an-indoor-location-system-for-disabled-students/?guccounter=1 or here: https://www.spidersweb.pl/2018/03/gps-dla-niewidomych-indoor-available.html)
