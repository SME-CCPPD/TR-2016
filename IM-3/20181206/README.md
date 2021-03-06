# IM 3 - Lezione del 6 dicembre 2018

## Argomenti

* realizzazione della *nuvola* con `csound`
  * introduzione a `csound`
    * metafora `orchestra`/`partitura`
    * `a-rate` e `k-rate`
    * tipi di variabili: `a-`, `k-`, `i-`, `p-`, ecc.
    * esempio n.1

## Lavagne

![whiteboard 1](./TR_III_IM_3_2018-12-06_11.07.30.jpg)

## [Esempio `csound`](./primo.csd)

```csound
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
```
