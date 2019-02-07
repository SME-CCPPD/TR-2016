
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1
/*Apertura dello strumento numero 1.*/
instr 1
iamp = p4
idur = p3
/**/
ifreq = p5
kmod oscil1 0, ifreq/10, idur, 1
kfreq = ifreq+kmod
aout oscil iamp, kfreq, 1

/*Creiamo un inviluppo per "pulire" il segnale*/

islope = idur/100
aout linen aout, islope, idur, islope
out aout
endin
