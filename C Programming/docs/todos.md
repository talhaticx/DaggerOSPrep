# **Project Idea: Simple File-Based Contact Management System**

## **Project Overview:**

Develop a contact management system that allows users to store, view, update, and delete contact information. This system will use file-based storage to ensure data persists between program runs.

## **Core Features:**

1. **Add Contact:**
   - **Description:** Users can add new contacts with details such as name, phone number, and email.
   - **Functionality:**

     - Prompt the user to enter contact details.
     - Store the contact in a data structure and append the information to a file for persistence.

2. **View Contacts:**
   - **Description:** Display a list of all stored contacts.
   - **Functionality:**
     - Read contact details from the file.
     - Print the list of contacts in a readable format on the screen.

3. **Update Contact:**
   - **Description:** Allow users to update existing contact information.
   - **Functionality:**
     - Provide an option to search for a contact by name.
     - Allow the user to modify the contact details and save changes back to the file.

4. **Delete Contact:**
   - **Description:** Remove a contact from the system.
   - **Functionality:**
     - Search for the contact by name.
     - Remove the contact from the in-memory list and update the file to reflect the change.

5. **Search Contact:**
   - **Description:** Search for a specific contact by name.
   - **Functionality:**
     - Allow users to input a search query.
     - Display matching contacts from the list or file.

## **Technical Requirements:**

1. **Data Structures:**
   - Use structures to define the contact information (name, phone number, email).
   - Maintain an array or dynamic list of contact structures to manage contacts in memory.

2. **File Handling:**
   - **Storing Contacts:** Use file operations to write contact information to a file in a structured format.
   - **Retrieving Contacts:** Read contact data from the file to load it into memory when the program starts.
   - **Updating and Deleting:** Handle file modifications to add, update, or delete contacts as needed.

3. **Dynamic Memory Allocation:**
   - Allocate memory dynamically for storing contacts, especially if you use a dynamic data structure like a linked list.

4. **Control Structures:**
   - Implement menus and prompts for user interaction using control structures (if-else statements, switch cases).
   - Use loops to repeatedly show the menu and perform actions until the user chooses to exit.

5. **Modular Programming:**
   - Organize your code into separate functions for adding, viewing, updating, deleting, and searching contacts.
   - Consider dividing the code into multiple files (e.g., main program, contact management functions) for better organization and maintainability.

6. **Error Handling:**
   - Handle errors such as file not found, read/write errors, and invalid user input gracefully.
   - Provide informative error messages to help users understand what went wrong.

## **User Interface:**

- **Menu System:** Create a simple command-line interface with a menu that allows users to choose between different operations (add, view, update, delete, search).
- **Prompts and Messages:** Clearly prompt the user for input and provide feedback after each operation (e.g., “Contact added successfully,” “Contact not found”).

## **Example Use Case:**

1. **Starting the Program:**
   - On startup, load existing contacts from the file into memory.
   - Display the main menu.

2. **Adding a Contact:**
   - User selects Add Contact from the menu.
   - User enters details for the new contact.
   - The contact is saved to both memory and file.

3. **Viewing Contacts:**
   - User selects View Contacts.
   - The program reads contacts from memory and displays them.

4. **Updating a Contact:**
   - User selects Update Contact.
   - User searches for a contact and provides new details.
   - The contact information is updated in memory and the file.

5. **Deleting a Contact:**
   - User selects Delete Contact.
   - User searches for a contact to remove.
   - The contact is deleted from memory and the file is updated.

6. **Searching for a Contact:**
   - User selects Search Contact.
   - User enters a name to search.
   - Matching contacts are displayed.

This project will give you practical experience with C programming concepts and is a good test of your ability to manage data, handle file I/O, and build user interfaces
