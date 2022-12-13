NAME		:=	libasm.a

ASM			:=	nasm

ASMFLAGS	:= -fmacho64

AR			:=	ar

ARFLAGS		:=	rcs

SRCS		:=	src/ft_read.s \
				src/ft_write.s \
				src/ft_strlen.s

OBJS		:=	${SRCS:.s=.o}

%.o:	%.s
		${ASM} ${ASMFLAGS} -o $@ $<

all:		${NAME}

${NAME}:	${OBJS}
		${AR} ${ARFLAGS} $@ $^

clean:
		rm -f ${OBJS}

fclean:		clean
		rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re