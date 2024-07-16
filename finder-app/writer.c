#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <syslog.h>


int main(int argc, char *argv[]){
	// prep syslog 
	openlog(NULL,0, LOG_USER);


	// check for correct number of arguments
	if(argc != 3){
		printf("Incorrect number of arguments. Expecting two arguments for file path and text string, but received %d.\nEx: ./writer /tmp/aesd/assignment1/sample.txt ios\n", argc);
		syslog(LOG_ERR, "Unexpected number of arguments. Expecting 3, but received %d", argc);
		exit(1);
	}

	/* Assignment instructs that the directory is guranteed to be present/available and the code doesn't need to validate. */
	FILE *fptr;

	fptr = fopen(argv[1], "w"); //do not use 'a' so it overwrites file content per assignment.

	if(fptr == NULL) {
		printf("File could not be created successfully\n");
		syslog(LOG_ERR, "File could not be opened successfully");
		exit(1);
	}

	fprintf(fptr,"%s", argv[2]);
	fclose(fptr);
	syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
	printf("File created successfully\n");

	exit(0);
}
