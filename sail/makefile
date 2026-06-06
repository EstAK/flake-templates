##
# Sail PROJECT
#
# @file
# @version 0.1

TARGET ?= main
SAIL_PROJ = project.sail_project

SAIL_SRC := $(shell find . -name '*.sail')
SAIL_DEP := $(SAIL_SRC) $(SAIL_PROJ)

.PHONY: all c clean

all: $(TARGET)
c: $(TARGET).c

$(TARGET).c: $(SAIL_DEP)
	sail -c $(TARGET) $(SAIL_PROJ) -o $(TARGET)

$(TARGET): $(TARGET).c
	cc $^ $(SAIL_DIR)/lib/*.c -lgmp -lz -I $(SAIL_DIR)/lib/ -o $@

clean:
	rm -rf $(TARGET).h $(TARGET).c $(TARGET)

# end
