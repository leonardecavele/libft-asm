NAME = test
SRCS = \
	   helloworld.asm \
	   putstr.asm \
	   putchar.asm \
	   strlen.asm \
	   itoa.asm

OBJS = $(SRCS:.asm=.o)

.PHONY: all clean fclean re

all: $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME)

%.o: %.asm
	nasm -f elf64 -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
