;csound-beep

  sr        =           44100
  kr        =           4410
  ksmps     =           10
  nchnls    =           1

instr 2
  ifreq     =           p5*p6                   ; 基本周波数(p5)に倍音(p6)をかけ算
  iamp      =           p4/p7                   ; 基音(p4)に対する音量比(1/p7)を音量に設定
  k1        linen       iamp, p8, p3, p9        ; エンベロープ
  a1        oscil       k1, ifreq, 1            ; 設定した周波数と音量でオシレータをドライブ
            out         a1
endin 



