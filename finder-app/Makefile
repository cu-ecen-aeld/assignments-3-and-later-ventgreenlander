

default: writer

all: clean writer


writer:
	$(CROSS_COMPILE)gcc -g -Wall -c -o writer.o writer.c
	$(CROSS_COMPILE)gcc -g -Wall -I/ writer.o -o writer

clean:
	-rm *.o writer
