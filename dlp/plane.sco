; Create a impulse table
f1 0  8  2  1 0 0 0 0 0 0 0

; waveform
f2 0 4096 10 1

;plane
;ins	start	dur	amp1	amp2	frq	cf1	cf2	bw1	bw2	atk	rel	pan1	pan2
;==================================================================================
i3	0.0	10	.0	.2	22050	5000	10000	5000	0	.0	.0	0.	1

i3	10.0	1.	.2	.2	22050	11025	11025	11025	11025	.0	.0	0.5	0.5
i3	12.0	0.9	.	.	.	.	.	.	.	.	.	.	.
i3	14.0	0.8	.	.	.	.	.	.	.	.	.	.	.
i3	16.0	0.7	.	.	.	.	.	.	.	.	.	.	.
i3	18.0	0.6	.	.	.	.	.	.	.	.	.	.	.
i3	20.0	0.5	.	.	.	.	.	.	.	.	.	.	.
i3	22.0	0.4	.	.	.	.	.	.	.	.	.	.	.
i3	24.0	0.3	.	.	.	.	.	.	.	.	.	.	.
i3	26.0	0.2	.	.	.	.	.	.	.	.	.	.	.
i3	28.0	0.1	.	.	.	.	.	.	.	.	.	.	.
i3	30.0	0.01	.	.	.	.	.	.	.	.	.	.	.


; p1�F�y��ԍ�(=3) 
; p2�F�J�n����(�b) 
; p3�F�p������(�b) 
; p4: �J�n���̉���(0.0 �` 1.0) 
; p5: �I�����̉���(0.0 �` 1.0) 
; p6: ���g���̍ő�͈́i=22050)
; p7: �J�n���̒��S���g��(Hz) 
; p8: �I�����̒��S���g��(Hz) 
; p9: �J�n���̎��g����(Hz) 
; p10: �I�����̎��g����(Hz) 
; p11: �A�^�b�N�^�C��(�b) 
; p12: �����[�X�^�C��(�b) 
; p13: �J�n���̒��(0.0=���A0. 5=�����A1.0=�E) 
; p14: �I�����̒��(0.0=���A0. 5=�����A1.0=�E) 