
sr        =         44100                         ; Sample Rate
kr        =         22050                         ; Control Rate
ksmps     =         2                             ; sr/kr As far as I know this is always the case
nchnls    =         2                             ; 1=mono, 2=stereo, 4=quad


          instr 1                                 ; Instrument 1 begins here
aout      oscil     10000, 440, 1                 ; An oscillator
          outs      aout, aout                    ; Output the results to a stereo sound file
          endin                                   ; Instrument 1 ends here


          instr  2                                ; Instrument 2 begins here
iamp      =         p4                            ; Amplitude
ifqc      =         p5                            ; Frequency
itabl1    =         p6                            ; Waveform Table
aout      oscil     iamp, ifqc, itabl1            ; An oscillator
          outs      aout, aout                    ; Output the results to a stereo sound file
          endin                                   ; Instrument 2 ends here


          instr     3                             ; Instrument 1 begins here
idur      =         p3                            ; Duration
iamp      =         p4                            ; Amplitude
ifqc      =         cpspch(p5)                    ; Frequency
itabl1    =         p6                            ; Waveform

; ATTACK DECAY SUSTAIN RELEASE ENVELOPE

kamp      linseg    0, .1, 1, .2, .8, p3-.5, .8, .2, 0
aout      oscil     iamp, ifqc, itabl1            ; An oscillator
          outs      aout*kamp, aout*kamp          ; Output the results to a stereo sound file
          endin                                   ; Instrument 3 ends here
