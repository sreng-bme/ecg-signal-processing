# ECG Signal Processing — MIT-BIH Record 100

A MATLAB-based ECG signal processing pipeline using real clinical data 
from the PhysioNet MIT-BIH Arrhythmia Database.

## What It Does
- Loads raw ECG data from PhysioNet (MIT-BIH Record 100)
- Converts binary signal to millivolts using ADC gain and baseline correction
- Simulates measurement noise and applies a moving average filter
- Detects R-peaks using adaptive peak detection
- Estimates heart rate from RR intervals

## Results
- Estimated Heart Rate: ~105 bpm
- Dataset: MIT-BIH Arrhythmia Database, Record 100 (PhysioNet)
- Sampling Frequency: 360 Hz

## Tools
- MATLAB Online
- PhysioNet MIT-BIH Arrhythmia Database

## About
Built as part of a biosignal processing portfolio focused on neural 
engineering and neurotech applications. Part of ongoing work toward 
EEG signal analysis and BCI development.

## Reference
Moody GB, Mark RG. The impact of the MIT-BIH Arrhythmia Database. 
IEEE Eng in Med and Biol 20(3):45-50 (May-June 2001).
