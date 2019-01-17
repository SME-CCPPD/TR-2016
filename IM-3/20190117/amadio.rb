#creazione nuvola
$:<< "."			#Formula maggica: aggiungi all'array delle posizioni dei file la directory corrente.
require "tables"	#Richiamo il file scritto con Octave.

#Definiamo una funzione di lookup.
def lookup(time)	#Restituisce le frequenze relative a time.
	t = ((time*100).round/100.0) - T[0]	#time viene arrotondato al centesimo.
	F[t*100]		#Valore restituito dalla funzione.
end

N = 500				#n elementi nuvola
mindur = 0.005
maxAmp = 25.0/N 
minAmp = maxAmp/100.0

#generiamo elementi tramite loop

puts "f1	0	4096	10	1"

1.upto(N) do | n|					#metodo upto: da 1 fino a n esegui loop
	at = rand()*(T[1]-T[0]) + T[0]	#action time (attacco)	
									#T[1]=6 T[0]=1 => rand tra 0 e 5

	dur = rand()*(T[1]-at - mindur)+ mindur			#calcolo durata
	amp = rand()*(maxAmp - minAmp) + minAmp			#calcolo ampiezza
	freq = rand()*(F[1] - F[0]) + F[0]				#calcolo frequenza
	puts "i1 #{at} #{dur} #{amp} #{freq}"
end


#per dare la forma che vogliamo abbiamo bisogno di funzione
#polinomiali di grado variabile
