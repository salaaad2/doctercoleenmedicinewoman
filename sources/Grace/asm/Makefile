# Colleen
#
# @file
# @version 0.1



# end
# Set the project, sources and build directory
SOURCEDIR=.
INCDIR=.
BUILDDIR=build

# Define include directory
INCLUDES = $(addprefix -I, $(INCDIR))

# Set command for OS
MKDIR=mkdir -p
RM=rm -rf

# Set variables of compilations
ASM=nasm
ASMFLAGS= -f elf64 -g
CC=gcc
CFLAGS= -Wall -Werror -Wextra -no-pie
LDFLAGS=
EXEC=Grace
VERBOSE=FALSE
HIDE=


# Define verbose for compilation
ifeq ($(VERBOSE), TRUE)
	HIDE =
else
	HIDE = @
endif


# Create a list of *.c sources in SOURCEDIR
SOURCES = $(wildcard $(SOURCEDIR)/*.s)

# Define objects for all sources
OBJS := $(patsubst ${SOURCEDIR}/%.s,${BUILDDIR}/%.o,${SOURCES})

# Define dependencies files for all objects
DEPS = $(OBJS:.o=.d)

# Remove space after separator


# Creation of object files
${BUILDDIR}/%.o: ${SOURCEDIR}/%.s
	$(HIDE)${ASM} ${ASMFLAGS} -o $@ $<

default: directories all

all: ${EXEC}

# Creation of the executable
$(EXEC): $(OBJS)
	@echo Linking $@
	$(CC) $(CFLAGS) $(OBJS) -o $(EXEC)

# Include dependencies
-include $(DEPS)


# Rule for sanitize the memory
asan: CFLAGS += -fsanitize=address
asan: directories all

directories:
	$(MKDIR) $(BUILDDIR)

# Remove all objects
clean:
	$(RM) $(wildcard $(BUILDDIR)/*.o) Grace_kid.s

# Remove all objects, dependencies and executable files generated during the build
fclean:
	$(HIDE)$(RM) $(BUILDDIR) $(EXEC) $(EXEC).dSYM Grace_kid.s
	@echo Cleaning done !

re: fclean default

.PHONY: re clean fclean all directories default
