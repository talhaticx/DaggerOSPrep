#!/bin/sh
# rm -f $TARGET $OBJECT

# Define the compiler and flags
CC=gcc
CFLAGS="-Wall -Wextra -Wshadow -O2"
TARGET=main
OBJECT=main.o

# Compile the source file into an object file
$CC $CFLAGS -c main.c

# Link the object file to create the executable
$CC $CFLAGS -o $TARGET $OBJECT

# Run the executable
./$TARGET

# Clean up the generated files
# rm -f $TARGET $OBJECT
