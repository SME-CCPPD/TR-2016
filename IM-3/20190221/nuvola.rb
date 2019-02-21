#@ = variabili interne
require "tables"	#Richiamo il file scritto con Octave.
class Nuvola
	MAXDUR = 0.5
	MINDUR = 0.005
	def initialize(line)
		#line.split splitta in 5 campi
		(@at,@dur,@minfreq,@deltafreq,@amp,@n) = line.split(/\s+/).map {|s| s.to_f } #Trasformo in stringa e poi in float.
		setup_tables
	end

	def lookup(time)	#Restituisce le frequenze relative a time.
		t = (time-@times[0])/@dur
		t = ((t*100).round/100.0)	#time viene arrotondato al centesimo.
		@frequencies[t*100]		#Valore restituito dalla funzione.
	end
	def to_csound()
		#------variabili-------------
		rit = ""			#variabile di ritorno
		tstart = @at 		#tempo
		tend = @at + @dur

		#-----------------------------	
		1.upto(@n) do 		#metodo upto: da 1 fino a @n
			at = rand()*(tend - tstart) + tstart	#action time (attacco)	
										#T[1]=6 T[0]=1 => rand tra 0 e 5

			dur = rand()*(MAXDUR-MINDUR)+ MINDUR			#calcolo durata
			
			(fmin, fmax) = lookup(at)
			
			freq = rand()*(fmax - fmin) + fmin				#calcolo frequenza
			amp = -20 #rand()*(maxAmp - minAmp) + minAmp			#calcolo ampiezza
			puts "i1 #{at} #{dur} #{amp} #{freq}"
		end
		return rit
	end
	
	private 
	def setup_tables
		@frequencies = F.map{|fa| [fa[0]*@deltafreq+@minfreq, fa[1]*@deltafreq+@minfreq]}
		@times = T.map{|t| t*@dur+@at}
	end
end
