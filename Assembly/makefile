# Makefile for assembling and linking an x86 Assembly program

# Directories
SRC_DIR = projects
BUILD_DIR = build

# Source and target names
TARGET = main
SRC = $(SRC_DIR)/$(TARGET).asm
OBJ = $(BUILD_DIR)/$(TARGET).o
EXEC = $(TARGET)

# Assembly and linking commands
ASM = nasm -f elf64
LD = ld -m elf_x86_64
# ASM = nasm -f elf32
# LD = ld -m elf_i386

# Default rule to clean, build, and run the program
all: clean $(EXEC)

# Rule to create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to assemble the source file
$(OBJ): $(BUILD_DIR) $(SRC)
	$(ASM) -o $(OBJ) $(SRC)

# Rule to link the object file
$(EXEC): $(OBJ)
	$(LD) $(OBJ) -o $(EXEC)

# Rule to run the program
run: $(EXEC)
	@echo "Running $(EXEC)..."
	@./$(EXEC) || echo "Program execution failed."

# Rule to clean up generated files
clean:
	@echo "Cleaning up..."
	rm -f $(OBJ) $(EXEC)
	rmdir $(BUILD_DIR) 2>/dev/null || true

# Ensure `clean`, `all`, `run` are phony targets
.PHONY: all clean run
