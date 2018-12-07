<CsoundSynthesizer>
<CsOptions>
-Wo ./test.wav
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1
/*Apertura dello strumento numero 1.*/
instr 1
iamp = ampdbfs (p4)
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

</CsInstruments>
<CsScore>
/*Creiamo la tavola*/
f1 0 8192 10 1
i1 0 1 -6 440
i1 0.5 2 -8 879

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
