; Create a impulse table
f1 0  8  2  1 0 0 0 0 0 0 0

; waveform
f2 0 4096 10 1

;dot
;ins	start	dur	amp	pan	wetamp
;=====================================
i1	0.0	0.01	0.8	0.0	0.8
i1	0.1	0.01	0.8	0.5	0.8
i1	0.3	0.01	0.8	1.0	0.0
i1	0.4	0.01	0.8	0.5	0.0
i1	0.6	0.01	0.8	1.0	0.0
i1	0.7	0.01	0.8	0.0	0.0
i1	0.9	0.01	0.8	0.5	0.0
i1	1.0	0.01	0.8	1.0	0.0

;line
;ins	start	dur	amp	cf1	cf2	f1	atk	rel	pan	wetamp
;===================================================================
i2	0	1	.4	30	70	2	.001	.001	0.5	0.0
i2	0	1	.1	7350	8820	2	.001	.001	0.5	0.0

i2	0	1	.5	14700	17640	2	.001	.001	0.1	0.0
i2	0	1	.5	17640	14700	2	.001	.001	0.9	0.0

;plane
;ins	start	dur	amp	frq	atk	rel	cf1	cf2	bw1	bw2	pan	wetamp
;===============================================================================
i3	0.0	0.67	.5	22050	.5	.0	20000	10000	0	1000	0.5	0.5	

i3	0.97	0.02	.2	22050	.01	.01	10000	10000	1000	1000	0.5	0.5	


