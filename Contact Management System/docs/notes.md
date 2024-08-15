# Contact Management System

## Overview

The Contact Management System is a simple C-based program that allows users to store, manage, and search for contact information. This program stores contact details such as name, phone number, and email address in a CSV file and provides various functionalities including adding, searching, deleting, and updating contacts.

## Features

- **Add Contact**: Add a new contact with a name, phone number, and email.
- **Print Contacts**: Display all stored contacts.
- **Search Contacts**: Search for a contact by name, phone number, or email.
- **Delete Contact**: Remove a contact by its ID.
- **Update Contact**: Update the details of an existing contact.
- **Persistent Storage**: All contacts are stored in a CSV file, ensuring data is retained between sessions.

## File Structure

- **src/main.c**: The entry point of the program. Handles the main menu and user interactions.
- **src/contact.c**: Implements functions related to contact management, such as adding, searching, and deleting contacts.
- **src/file_io.c**: Implements file input/output functions for reading from and writing to the CSV file.
- **include/contact.h**: Declares the `Contact` structure and function prototypes for `contact.c`.
- **include/file_io.h**: Declares function prototypes for `file_io.c`.

## Installation

1. Clone the repository:
Clone the repo in your machine and go to the current directory.

2. Compile the project:

   ```bash
   ./make
   ```

3. Run the program:

   ```bash
   ./main
   ```

## Usage

Once the program is running, you will be presented with a menu with the following options:

0. **Exit**: Exit the program.
1. **Print Contacts**: Display all stored contacts.
2. **Add Contact**: Add a new contact.
3. **Remove Contact**: Delete an existing contact by its ID.
4. **Search Contacts**: Search for contacts by name, phone number, or email.
5. **Update Contact**: Update the details of an existing contact.

### Example Usage

1. To add a new contact, select option `2` from the menu and follow the prompts.
2. To view all contacts, select option `1` from the menu.
3. To delete a contact, select option `3`, enter the contact ID, and confirm the deletion.

## Known Issues

- File handling assumes the CSV format and may break if the format is changed manually.

## Future Improvements

- Implement contact sorting by name or number.
- Improve error handling for invalid input.
- Add support for importing and exporting contacts in different formats (e.g., JSON, XML).

## Contributing

If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are welcome.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Contact

Created by Your Name - [Your Email](mailto:mtalhaayaz2005@gmail.com)
