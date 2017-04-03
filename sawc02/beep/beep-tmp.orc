
  sr        =           44100                   ; Sample Rate
  kr        =           22050                   ; Control Rate
  ksmps     =           2                       ; sr/kr As far as I know this is always the case
  nchnls    =           2                       ; 1=mono, 2=stereo, 4=quad


instr 1                                         ; Instrument 1 begins here
  iamp      =           p4
  ifaq      =           p5
  itabl1    =           p6
  aout      oscil       iamp, ifaq, itabl1      ; An oscillator
            outs        aout, aout              ; Output the results to a stereo sound file
endin                                           ; Instrument 1 ends here
