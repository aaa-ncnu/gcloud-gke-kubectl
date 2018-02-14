import os, subprocess, string;

environment_var = os.getenv('PLUGIN_KUBECTL_COMMANDS', '')
print os.getenv('PLUGIN_KUBECTL_COMMANDS', '')

if environment_var:
  commands = string.split(environment_var, ",")

  for command in commands:
    try:
      p = subprocess.Popen('kubectl ' + str(command), shell=True, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
      (out,err) = p.communicate()
      if p.returncode == 0:
        print ("command kubectl %s succeeded, returned: %s" % (str(command),str(out)))
      elif p.returncode <= 125:
        print ("command kubectl %s failed, exit-code=%d error = %s" % (str(command), p.returncode, str(err)))
      elif p.returncode == 127:
        print ("Not found")
      else:
        sys.exit("'%s' likely crashed, shell retruned code %d" % (cmd,e.returncode))
    except OSError as e:
      print("Execution failed:", e)
