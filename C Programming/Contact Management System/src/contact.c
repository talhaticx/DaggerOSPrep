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

    if (contact_count != 0) {
        bold_cyan();
        printf("\nNumber of contacts: %d\n\n", contact_count);
        reset();
        bold_magenta();
        printf(" %-6s%-20s%-15s%-25s\n", "No.", "Name", "Number", "Email");
        reset();
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
    else {
        bold_red();
        printf("\nNo contacts found\n");
        reset();
    }
}

void deleteContact() {
    int contact_id;
    printContacts();
    bold_green();
    printf("\nEnter the contact id to delete: ");
    reset();
    scanf("%d", &contact_id);

    if (contact_id < 1 || contact_id > contact_count) {
        bold_red();
        printf("Invalid contact id\n");
        reset();
        return;
    }
    Contact *new_contacts = malloc((contact_count - 1) * sizeof(Contact));
    if (new_contacts == NULL) {
        bold_red();
        printf("Memory allocation failed\n");
        reset();
        return;
    }
    int j = 0;  // Index for new_contacts array
    for (int i = 0; i < contact_count; i++) {
        if (i + 1 != contact_id) {
            new_contacts[j] = contacts[i];
            j++;
        }
    }

    free(contacts);
    contacts = new_contacts;

    contact_count--;

    write_all_contacts_to_file(contact_count, contacts);
    bold_green();
    printf("Contact deleted successfully\n");
    reset();
}

void searchContact() {
    char search_query[50];
    bold_green();
    int ch;
    while ((ch = getchar()) != '\n' && ch != EOF);

    printf("\nEnter the name or number to search: ");
    reset();
    fgets(search_query, sizeof(search_query), stdin);
    search_query[strcspn(search_query, "\n")] = '\0';

    for (int i = 0; i < contact_count; i++) {
        if (strstr(contacts[i].name, search_query) || strstr(contacts[i].number, search_query)) {
            bold_magenta();
            printf("\nFound contact %d:\n", i + 1);
            reset();
            printf("Name: %s\n", contacts[i].name);
            printf("Number: %s\n", contacts[i].number);
            printf("Email: %s\n", contacts[i].email);
            return;
        };
    }
    bold_red();
    printf("No contacts found matching the search query\n");
    reset();
    return;
            
};

void updateContact() {
    int contact_id;
    printContacts();
    bold_green();
    printf("\nEnter the contact id to update: ");
    reset();
    scanf("%d", &contact_id);

    if (contact_id < 1 || contact_id > contact_count) {
        bold_red();
        printf("Invalid contact id\n");
        reset();
        return;
    }

    Contact *c = malloc(sizeof(Contact));  // Allocate memory
    if (c == NULL) {
        printf("Memory allocation failed\n");
        return;
    }

    printf("Enter updated contact details:\n");

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
    bold_green();
    printf("Contact updated successfully\n");
    reset();
    write_to_file(c);  // Call the write_to_file function // Free the allocated memory
    contacts[contact_id - 1] = *c;  // Update the contact in the contacts array
    free(c);
    write_all_contacts_to_file(contact_count, contacts);
}