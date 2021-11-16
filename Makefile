default: all
#==============================================================================#
#--------------------------------- SHELL --------------------------------------#
#==============================================================================#
SHELL			:= /bin/sh
OS				 = $(shell uname)
#==============================================================================#
#------------------------------ DIRECTORIES -----------------------------------#
#==============================================================================#
SRCS_DIR		 = src/
OBJS_DIR		 = obj/
LFT_DIR			 = libft/
LFT_INCS_DIR	 = ${LFT_DIR}include/
LFT_SRCS_DIR	 = ${LFT_DIR}src/
#==============================================================================#
#--------------------------------- FILES --------------------------------------#
#==============================================================================#
SRCS_NAME		 = main
#------------------------------------------------------------------------------#
SRCS			 = $(addprefix ${SRCS_DIR}, $(addsuffix .c, ${SRCS_NAME}))
#------------------------------------------------------------------------------#
INCS_NAME		 = main
#------------------------------------------------------------------------------#
INCS			 = $(addprefix ${SRCS_DIR}, $(addsuffix .h, ${INCS_NAME}))
INCS			+= $(patsubst %.c,%.h,${SRCS})
#------------------------------------------------------------------------------#
OBJS			 = $(patsubst ${SRCS_DIR}%.c,${OBJS_DIR}%.o,${SRCS})
#------------------------------------------------------------------------------#
NAME			 = Coleen
#------------------------------------------------------------------------------#
LFT_SRCS		 = $(shell find ${LFT_SRCS_DIR} -name "*.c")
#==============================================================================#
#-------------------------------- COMPILER ------------------------------------#
#==============================================================================#
ifeq (${OS}, FreeBSD)
CC				 = cc
endif
ifeq (${OS}, Linux)
CC				 = clang
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
LDFLAGS			 = -L${LFT_DIR}
LDFLAGS			+= -lft
#==============================================================================#
#--------------------------------- UNIX ---------------------------------------#
#==============================================================================#
RM				= rm -rf
MKDIR			= mkdir -p
#==============================================================================#
#--------------------------------- RULES --------------------------------------#
#==============================================================================#
LFTRULE			= all
#------------------------------------------------------------------------------#
${OBJS_DIR}%.o:	${SRCS_DIR}%.c ${INCS}
	${CC} -c ${CFLAGS} ${CDEFS} -I${LFT_INCS_DIR} -o $@ $<
#------------------------------------------------------------------------------#
${OBJS_DIR}:
	${MKDIR} ${OBJS_DIR}
#------------------------------------------------------------------------------#
$(NAME): ${OBJS} ${LFT_SRCS} ${LFT_INCS_DIR}libft.h
	$(MAKE) --no-print-directory -C ${LFT_DIR} ${LFTRULE}
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
	@$(MAKE) --no-print-directory -C ${LFT_DIR} clean
	${RM} ${OBJS_DIR} vgcore*
#------------------------------------------------------------------------------#
fclean: clean
	@$(MAKE) --no-print-directory -C ${LFT_DIR} fclean
	${RM} ${NAME} ${NAME}.core ${NAME}.dSYM/ qwe minishell_history
#------------------------------------------------------------------------------#
re: fclean all
#------------------------------------------------------------------------------#
run: all
	./${NAME} google.com
#------------------------------------------------------------------------------#
.PHONY:	all clean clean fclean re debug asan run