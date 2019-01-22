# TUTORIAL FOR THE STANDARD LOCALIZER


This is a simple and fast acquisition procedure based on a 5-minute functional magnetic resonance imaging (fMRI) sequence that can be run 
as easily and as systematically as an anatomical scan. This protocol captures the cerebral bases of auditory and visual perception, motor 
actions, reading, language comprehension and mental calculation at an individual level. Individual functional maps are reliable and quite 
precise. In Pinel et al. 2007 we showed that 80% of main maxima (isolated with a 30-minute long acquisition) were detected in this 
5-minute design, with an average spatial precision of 6mm. 

When using this protocol for a paper please reference the following article:
Pinel P, Thirion B, Meriaux S, Jobert A, Serres J, Le Bihan D, Poline JB and Dehaene S. (2007). 
Fast reproducible identification and large-scale databasing of individual functional cognitive networks. BMC Neuroscience, 8, 91.

Initially this protocol was proposed in Eprime. But today we prefer to work with a modular, free framework and independant of the Operating System.
So we propose here a new version of this protocol in python. We use a python framework which is Expyriment ([https://www.expyriment.org/](https://www.expyriment.org/))
for running stimuli in fMRI. 

Here we present the french version, but other version (english, spanish ...) are still available in Eprime at [http://www.neurospin-wiki.org/pmwiki/Main/SharingAndExampleOfProtocols](http://www.neurospin-wiki.org/pmwiki/Main/SharingAndExampleOfProtocols).
If you need a python version, don't hesitate to post a resquest on the issue part.
Some scripts are available to convert Eprime stimuli in csv files in this repository. As we are going to see that in this tutorial, csv files 
are the files containing the onset, kind of stim and sources of the protocol.



## Prerequisites

To run this stimu, you will need:

* The python module: Expyriment ([https://www.expyriment.org/](https://www.expyriment.org/))
* A video screen and projector for visual stimuli
* Earphones for auditory stimuli
* Two response buttons (usually, subjects’ response are not analyzed; you can eventually just simulate button response) for the left and right thumbs.

To acquire the localizer we use a TR of 2.4 sec, and try to cover all the brain (except eventually a part of the cerebellum). 


## Installation 

     cd /tmp
     git clone https://github.com/neurospin-stim/localizer_standard.git
     cd neurospin-stim
     python setup.py install --user


## Launch the protocol
### Basic level

        python quick_localizer_standard.py


### Advanced level
The advanced level is the same as the basic level, but we detail the options. All documentation for the options are available by using:

    python localizer_standard.py -h

In a few words, the script use a csv file in which the experimentater describes the stimuli.
Each line indicates the name of the stim (clicDaudio ...), the onset, the kind of stim (sound, rsvp ...) and the source (audio file, list of words ...).

The command for the localizer protocol with the options is:

    python localizer_standard.py --background-color 0 0 0 --text-color 250 250 250 --rsvp-display-time=250 --rsvp-display-isi=100 --picture-display-time=200 --picture-isi=0 --fs_delay_time=100 --stim-dir stim_files --splash ./instructions_localizer_time.csv --total-duration=301000 

The options for the localizer are: 

* --background-color 0 0 0 : color of the background
* --text-color 250 250 250 : color of the text
* --rsvp-display-time=250 : set the duration of display of single words in rsvp stimuli
* --rsvp-display-isi=100 : set the duration of display of single words in rsvp stimuli
* --picture-display-time=200 :  set the duration of display of pictures
* --picture-isi=0 : set the ISI between pictures in pictseq sequence
* --fs_delay_time=100 : time between the end of blanck screen and the beginning of fixation cross
* --stim-dir stim_files : directory in which stim are available
* --splash ./instructions_localizer_time.csv : file for instructions
* --total-duration=301000 : all duration of the expyriment


# IMPORT AND PROCESS DATA
Here we propose one possibity to import and process data.
Some points are linked to the neurospin organisation.

##  Data importation 
Please see the importation with BIDS [https://github.com/neurospin/unicog/tree/master/bids](https://github.com/neurospin/unicog/tree/master/bids).

## Preprocessing
Please see [https://github.com/neurospin/unicog/tree/master/unicogfmri](https://github.com/neurospin/unicog/tree/master/unicogfmri).
The onset are available in the csv files. All events are logged with Epyriment. Please take a look into events and data directories.


