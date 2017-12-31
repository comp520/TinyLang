tiny: grammar
	javac tiny/*.java tiny/lexer/*.java tiny/parser/*.java tiny/node/*.java tiny/analysis/*.java 

grammar: tiny.sablecc
	sablecc tiny.sablecc

check:	
	./check

clean:	
	rm -fr tiny/*.class tiny/lexer/ tiny/parser/ tiny/node/ tiny/analysis/ result
