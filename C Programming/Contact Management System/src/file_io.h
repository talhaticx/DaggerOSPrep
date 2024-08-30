#ifndef FILE_IO_H
#define FILE_IO_H

#include "contact.h"

void write_to_file(Contact *c);
void write_all_contacts_to_file(int contact_count, Contact *contacts);
Contact *read_from_file(int *contact_count, Contact *contacts);

#endif
