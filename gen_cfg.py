#!/usr/bin/python

import sys

services = []
for i in range(1, len(sys.argv), 2):
	services.append((sys.argv[i], sys.argv[i + 1]))

f = open('server_config.cfg', 'w')
f.write('application: {\n');
f.write('connectSocket: { port=49503; transport="tcp"; qlen=5; };\n');
f.write('services: {\n');
f.write('serviceNamesList = (');
list = ""
for i in range(0, len(sys.argv) / 2):
	(s, ip) = services[i]
	if not (i == 0):
		list += ','	
	list += '"' + s + '"'	
f.write(list + ');\n');

for (s, ip) in services:
	f.write(s + ': { service_Ip = ["' + ip +'"]; };\n');

f.write('};\n}');
f.close()
