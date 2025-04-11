DIR_SRC = src
DIR_OBJ = out
DIR_BUILD = build

SRC := $(shell find $(DIR_SRC)/*.c)
OBJ := $(patsubst %.c,$(DIR_OBJ)/%.o,$(SRC))

CCFLAGS = -Wall -Wextra -O2 
LDFLAGS = -lm

CC = gcc
LD = ld

build: $(OBJ)
	@mkdir -p $(DIR_BUILD)
	$(LD) $(LDFLAGS) $(OBJ) $(DIR_BUILD)/ccb

$(OBJ): $(SRC)
	

config:
	@touch HCFG.h
	@echo "Configuring HCFG.h..."
	@$(echo "") > HCFG.h
	@read -p "Enable FEATURE_X (y/n)? " FEATURE_X; \
	if [ $$FEATURE_X = "y" ]; then \
		sed -i '/#define FEATURE_X/d' HCFG.h; \
		echo "#define FEATURE_X" >> HCFG.h; \
	else \
		sed -i '/#define FEATURE_X/d' HCFG.h; \
	fi
	@read -p "Enable FEATURE_Y (y/n)? " FEATURE_Y; \
	if [ $$FEATURE_Y = "y" ]; then \
		sed -i '/#define FEATURE_Y/d' HCFG.h; \
		echo "#define FEATURE_Y" >> HCFG.h; \
	else \
		sed -i '/#define FEATURE_Y/d' HCFG.h; \
	fi
	@echo "Configuration complete."