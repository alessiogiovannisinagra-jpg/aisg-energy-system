# Makefile for the aisg-energy-system C project

# Compiler
CC = gcc

# Compilation flags
CFLAGS = -Wall -Wextra -O2

# Source files
SRC = $(wildcard *.c)

# Object files
OBJ = $(SRC:.c=.o)

# Executable
TARGET = aisg_energy_system

# Default target
all: $(TARGET)

# Link the target
$(TARGET): $(OBJ)
	$(CC) -o $@ $^

# Rule for object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
