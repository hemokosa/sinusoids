  sr        =           44100
  kr        =           44100
  ksmps     =           1
  nchnls    =           2

instr 1
  ipanfreq  =           p9
  iampamp   =           p10
  iampfreq  =           p11

  k1        linen       p4, p7, p3, p8
  k2        line        p5, p3, p6
  kpan      oscil       .5, ipanfreq, 1
  kpanlfo   =           kpan+.5
  kamp      oscil       iampamp, iampfreq, 1
  kamplfo   =           kamp+.5
  a1        oscil       k1*kamplfo, k2, 1
            outs        a1*kpanlfo, a1*(1.-kpanlfo)
endin 

