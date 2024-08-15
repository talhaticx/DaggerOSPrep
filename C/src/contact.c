#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "contact.h"
#include "file_io.h"  // Include this to avoid implicit declaration
#include "colors.h"

static int contact_count = 0;
static Contact *contacts;

void getContacts() {
    contacts = read_from_file(&contact_count, contacts);
}

void addContact() {
    Contact *c = malloc(sizeof(Contact));  // Allocate memory
    if (c == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    printf("Enter contact details:\n");

    int ch;
    while ((ch = getchar()) != '\n' && ch != EOF);

    printf("Phone number: ");
    fgets(c->number, sizeof(c->number), stdin);
    c->number[strcspn(c->number, "\n")] = 0;

    printf("Name: ");
    fgets(c->name, sizeof(c->name), stdin);
    c->name[strcspn(c->name, "\n")] = 0;

    printf("Email: ");
    fgets(c->email, sizeof(c->email), stdin);
    c->email[strcspn(c->email, "\n")] = 0;

    printf("Contact added successfully\n");

    write_to_file(c);  // Call the write_to_file function

    free(c);  // Free the allocated memory
}

void printContacts() {
    getContacts();

    if (contacts != NULL) {
        bold_cyan();
        printf("\nNumber of contacts: %d\n\n", contact_count);

        bold_magenta();
        printf(" %-6s%-20s%-15s%-25s\n", "No.", "Name", "Number", "Email");
        
        for (int i = 0; i < contact_count; i++) {
            red();
            printf(" %-6d", i + 1);
            italic_green();
            printf("%-20s", contacts[i].name);
            italic_blue();
            printf("%-15s", contacts[i].number);
            italic_yellow();
            printf("%-25s\n", contacts[i].email);
            reset();
        }
    }
}

void deleteContact() {}

void searchContact() {}

void updateContact() {}