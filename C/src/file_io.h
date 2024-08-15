#ifndef FILE_IO_H
#define FILE_IO_H

#include "contact.h"

void write_to_file(Contact *c);
Contact *read_from_file(int *contact_count, Contact *contacts);

#endif
