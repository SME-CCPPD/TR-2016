#make
#
#

test.wav: amadio.sco
	csound amadio.orc amadio.sco 

amadio.sco : amadio.rb nuvola.rb 	#dipende 
	ruby amadio.rb > amadio.sco