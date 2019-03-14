#creazione nuvola
$:<< "."			#Formula maggica: aggiungi all'array delle posizioni dei file la directory corrente.
require "tables"	#Richiamo il file scritto con Octave.
require "nuvola"


N = 500				#n elementi nuvola
maxAmp = 36.0/N
minAmp = maxAmp/100 
nuvole = []		#array di nuvole

#generiamo elementi tramite loop

puts "f1	0	4096	10	1"
File.open("amadio.meta","r") do 
	|fh|				#funzione file mi passa i dati
	while(!fh.eof?)		#true se a fine file
		line = fh.readline
		nuvole << Nuvola.new(line)
	end
end
nuvole.each{|n| puts n.to_csound}
