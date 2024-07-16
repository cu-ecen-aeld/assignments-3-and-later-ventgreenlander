
default: writer

all: clean writer


writer:
	gcc -g -Wall -c -o writer.o writer.c
	gcc -g -Wall -I/ writer.o -o writer

clean:
	-rm *.o writer
