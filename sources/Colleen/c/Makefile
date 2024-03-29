default: all
#==============================================================================#
#--------------------------------- SHELL --------------------------------------#
#==============================================================================#
SHELL			:= /bin/sh
OS				 = $(shell uname)
#==============================================================================#
#------------------------------ DIRECTORIES -----------------------------------#
#==============================================================================#
OBJS_DIR		 = obj/
#==============================================================================#
#--------------------------------- FILES --------------------------------------#
#==============================================================================#
SRCS_NAME		 = Colleen
#------------------------------------------------------------------------------#
SRCS			 = $(addprefix , $(addsuffix .c, ${SRCS_NAME}))
#------------------------------------------------------------------------------#
OBJS			 = $(patsubst ${SRCS_DIR}%.c,${OBJS_DIR}%.o,${SRCS})
#------------------------------------------------------------------------------#
NAME			 = Colleen
#------------------------------------------------------------------------------#
#==============================================================================#
#-------------------------------- COMPILER ------------------------------------#
#==============================================================================#
ifeq (${OS}, FreeBSD)
CC				 = cc
endif
ifeq (${OS}, Linux)
CC				 = gcc
endif
ifeq (${OS}, Darwin)
CC				 = cc
endif
CFLAGS			= -Wall
CFLAGS			+= -Wextra
CFLAGS			+= -Werror
CFLAGS			+= -pedantic
#------------------------------------------------------------------------------#
#------------------------------------------------------------------------------#
#==============================================================================#
#--------------------------------- UNIX ---------------------------------------#
#==============================================================================#
RM				= rm -rf
MKDIR			= mkdir -p
#==============================================================================#
#--------------------------------- RULES --------------------------------------#
#==============================================================================#
#------------------------------------------------------------------------------#
${OBJS_DIR}%.o:	${SRCS_DIR}%.c
	${CC} -c ${CFLAGS} ${CDEFS} -o $@ $<
#------------------------------------------------------------------------------#
${OBJS_DIR}:
	${MKDIR} ${OBJS_DIR}
#------------------------------------------------------------------------------#
$(NAME): ${OBJS} 
	${CC} ${CFLAGS} ${CDEFS} -o ${NAME} ${OBJS} ${LDFLAGS}
#------------------------------------------------------------------------------#
all: ${OBJS_DIR} ${NAME}
#------------------------------------------------------------------------------#
debug: CFLAGS += -glldb
debug: LFTRULE = debug
debug: all
#------------------------------------------------------------------------------#
asan: CFLAGS += -glldb
asan: CFLAGS += -fsanitize=address
asan: LFTRULE = asan
asan: all
#------------------------------------------------------------------------------#
msan: CFLAGS += -glldb
msan: CFLAGS += -fsanitize=memory
msan: CFLAGS += -fsanitize-memory-track-origins
msan: CFLAGS += -fno-common
msan: CFLAGS += -fno-omit-frame-pointer
msan: LFTRULE = msan
msan: all
#------------------------------------------------------------------------------#
clean:
	${RM} ${OBJS_DIR} vgcore*
#------------------------------------------------------------------------------#
fclean: clean
	${RM} ${NAME} ${NAME}.core ${NAME}.dSYM/ qwe minishell_history
#------------------------------------------------------------------------------#
re: fclean all
#------------------------------------------------------------------------------#
run: all
	./${NAME} google.com
#------------------------------------------------------------------------------#
.PHONY:	all clean clean fclean re debug asan run
