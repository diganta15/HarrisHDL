# Directories
SRC_DIR := src
TB_DIR  := tb
BUILD_DIR := build

# Tools
IVERILOG := iverilog
VVP := vvp

# File discovery
SRC_FILES := $(wildcard $(SRC_DIR)/*.sv)
TB_FILES := $(wildcard $(TB_DIR)/*_tb.sv)
TB_NAMES := $(notdir $(TB_FILES:.sv=))  # e.g., and_gate_tb

# Default target: build and run all testbenches
all: $(TB_NAMES)

# Pattern rule to compile and run each testbench
$(BUILD_DIR)/%: $(TB_DIR)/%.sv $(SRC_FILES) | $(BUILD_DIR)
	@echo "🔧 Compiling $<..."
	$(IVERILOG) -g2012 -o $@ $^
	@echo "🚀 Running $@..."
	$(VVP) $@

# Shortcut targets to build and run testbenches by name
$(TB_NAMES):
	$(MAKE) $(BUILD_DIR)/$@

# Create build directory if needed
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Cleanup
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean $(TB_NAMES)
