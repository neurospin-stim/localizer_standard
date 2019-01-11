import subprocess
import re
import glob

event_files = glob.glob('/volatile/depot_neurospin-stim/localizer_standard/stim_files/*wav')

print(event_files)

for f in event_files:
    process = subprocess.Popen(['avconv',  '-i', f], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stdout, stderr = process.communicate()
    matches = re.search(r"Duration:\s{1}(?P<hours>\d+?):(?P<minutes>\d+?):(?P<seconds>\d+\.\d+?),", stdout, re.DOTALL).groupdict()
    
#    print matches['hours']
    print('\n')
    print(f)
    print(matches['minutes'])
    print(matches['seconds'])