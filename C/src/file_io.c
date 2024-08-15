#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "file_io.h"

#define FILE_NAME "contacts.csv" 

void write_to_file(Contact *c) {
    FILE *filePtr = fopen(FILE_NAME, "a+");

    if (filePtr == NULL){
        printf("Error opening file.\n");
        return;
    }

    fprintf(filePtr, "%s,%s,%s\n", c->name, c->number, c->email);
    // contact_count++;
    fclose(filePtr);    
}

Contact *read_from_file(int *contact_count, Contact *contacts) {
    FILE *filePtr = fopen(FILE_NAME, "r");
    if (filePtr == NULL) {
        printf("Error opening file.\n");
        return NULL;
    }

    int count = 0;
    char buffer[256];  // A reasonable buffer size for lines

    // Count the number of lines in the file
    while (fgets(buffer, sizeof(buffer), filePtr)) {
        count++;
    }

    rewind(filePtr);

    // Allocate memory for contacts
    contacts = (Contact*) malloc(count * sizeof(Contact));
    if (contacts == NULL) {
        printf("Memory allocation failed.\n");
        fclose(filePtr);
        return NULL;
    }

    int counter = 0;
    while (fgets(buffer, sizeof(buffer), filePtr)) {
        // Remove trailing newline character, if present
        buffer[strcspn(buffer, "\n")] = '\0';

        char *token = strtok(buffer, ",");
        if (token) strncpy(contacts[counter].name, token, sizeof(contacts[counter].name));

        token = strtok(NULL, ",");
        if (token) strncpy(contacts[counter].number, token, sizeof(contacts[counter].number));

        token = strtok(NULL, ",");
        if (token) strncpy(contacts[counter].email, token, sizeof(contacts[counter].email));

        counter++;
    }

    fclose(filePtr);

    if (contact_count) {
        *contact_count = count;  // Set the contact count if provided
    }

    return contacts;
}
