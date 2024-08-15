#ifndef CONTACT_H
#define CONTACT_H

typedef struct {
    char number[15];
    char name[30];
    char email[45];
} Contact;

void addContact();
void printContacts();
void searchContact();
void deleteContact();
void updateContact();

#endif