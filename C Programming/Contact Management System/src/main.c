#include <stdio.h>

#include "contact.h"


int main() {

    while (1){
        int choice;
        printf("\n1. Print Contacts\n2. Add Contact\n3. Remove contact\n4. Search contacts\n5. Update Contact\n0. Exit\n\nEnter your choice: ");
        scanf("%d", &choice);
        printf("\n");

        if (choice == 1) {
            printContacts();
        } else if (choice == 2) {
            addContact();
        } else if (choice == 3) {
            deleteContact();
        } else if (choice == 4) {
            searchContact();
        } else if (choice == 5) {
            updateContact();
        } else if (choice == 0) {
            printf("Exiting...\n");
            return 0;
        } else {
            printf("Invalid choice. Please try again.\n");
        }

    }

    return 0;
}
