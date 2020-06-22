all: bin/Geometry

bin/Geometry: build/main.o build/Figure.o build/Output.o build/Pars.o
	g++ -Wall -Werror build/main.o build/Figure.o build/Output.o build/Pars.o -o bin/Geometry -lm

build/main.o: src/main.cpp
	g++ -Wall -Werror -c src/main.cpp -o build/main.o

build/Figure.o: src/Figure.cpp
	g++ -Wall -Werror -c src/Figure.cpp -o build/Figure.o

build/Output.o: src/Output.cpp
	g++ -Wall -Werror -c src/Output.cpp -o build/Output.o

build/Pars.o: src/Pars.cpp
	g++ -Wall -Werror -c src/Pars.cpp -o build/Pars.o	

clean:
	rm -rf build/*.o bin/Geometry 


.PHONY: clean 	
