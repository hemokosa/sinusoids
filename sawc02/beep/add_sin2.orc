;toot2������(�{���������w��ł���悤��)

sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         1

	instr 2
ifreq 	= 	p5*p6			; ��{���g��(p5)�ɔ{��(p6)�������Z
iamp 	= 	p4/p7			; �(p4)�ɑ΂��鉹�ʔ�(1/p7)�����ʂɐݒ�
k1	linen	iamp, p8, p3, p9	; �G���x���[�v
a1      oscil     k1, ifreq, 1		; �ݒ肵�����g���Ɖ��ʂŃI�V���[�^���h���C�u
        out       a1		      	
       	endin				



