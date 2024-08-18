
# **1. Hello, World!**

**Difficulty:** Easy  
**Objective:** Write a simple program that prints "Hello, World!" to the console using system calls.
**Concepts Covered:** Basic Assembly syntax, system calls, and I/O operations.

# **2. Basic Calculator**

**Difficulty:** Easy to Medium  
**Objective:** Create a simple calculator that performs basic arithmetic operations (addition, subtraction, multiplication, division) on integer inputs.
**Concepts Covered:** Arithmetic operations, user input handling, basic control flow (e.g., loops and conditional statements).

# **3. File I/O Operations**

**Difficulty:** Medium  
**Objective:** Write a program that reads a text file, counts the number of lines, words, and characters, and outputs these counts to the console.
**Concepts Covered:** File handling, reading and writing files using system calls, and string manipulation.

# **4. Memory Management Utilities**

**Difficulty:** Medium to Hard  
**Objective:** Implement a simple memory management utility that simulates dynamic memory allocation and deallocation (like `malloc` and `free`).
**Concepts Covered:** Memory allocation, pointers, and managing memory blocks manually.

# **5. Mini Shell**

**Difficulty:** Hard  
**Objective:** Build a minimal command-line shell that can execute basic commands (like `ls`, `cat`, and `echo`), handle simple pipes, and support basic command-line arguments.
**Concepts Covered:** Process management, system calls for executing commands, handling pipes and redirection, and parsing command-line arguments.

# **Project Details:**

## **1. Hello, World!**

**Objective:** Print "Hello, World!" to the console.  
**System Calls:** `sys_write` for output, `sys_exit` for terminating the program.

## **2. Basic Calculator**

**Objective:** Accept user input for two integers and an operator, then compute and display the result.  
**Features:**

- Implement arithmetic operations.
- Handle errors (like division by zero).

## **3. File I/O Operations**

**Objective:** Read from a file and count lines, words, and characters.  
**Features:**

- Use `sys_open`, `sys_read`, and `sys_close` for file operations.
- Implement a method to count words and lines.

## **4. Memory Management Utilities**

**Objective:** Simulate dynamic memory management functions.  
**Features:**

- Implement a basic allocator and deallocator.
- Track allocated memory and handle simple cases of fragmentation.

## **5. Mini Shell**

**Objective:** Create a shell that can run commands and handle piping.  
**Features:**

- Implement command parsing and execution.
- Handle input/output redirection and simple pipes between commands.

These projects will help you build a solid understanding of 32-bit x86 Assembly programming through hands-on experience. Start with simpler projects to build confidence and gradually tackle more complex challenges.
