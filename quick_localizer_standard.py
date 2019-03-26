#! /usr/bin/env python

import subprocess
#
subprocess.call(['python', 'localizer_standard.py', '--background-color', '0', '0', '0',
                 '--text-color', '250', '250', '250', 
                 '--rsvp-display-time', '250', 
                 '--rsvp-display-isi', '100',
                 '--picture-display-time', '200',
                 '--picture-isi', '0',
                 '--fs_delay_time', '100',
                 '--stim-dir', 'stim_files', 
                 '--total-duration', '301000',  '--cali'])
