NAME		:=	libasm.a

ASM			:=	nasm

ASMFLAGS	:= -fmacho64

AR			:=	ar

ARFLAGS		:=	rcs

SRCS		:=	src/ft_read.s \
				src/ft_write.s \
				src/ft_strlen.s \
				src/ft_strcpy.s \
				src/ft_strdup.s \
				src/ft_strcmp.s

OBJS		:=	${SRCS:.s=.o}

%.o:	%.s
		${ASM} ${ASMFLAGS} -o $@ $<

all:		${NAME}

test:
		gcc test/main.c libasm.a && ./a.out

${NAME}:	${OBJS}
		${AR} ${ARFLAGS} $@ $^

clean:
		rm -f ${OBJS}
		rm -f a.out

fclean:		clean
		rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re test