import sys, json, subprocess;

commands = json.loads(sys.argv[1])

for command in commands:
  print('kubectl ' + str(command))

