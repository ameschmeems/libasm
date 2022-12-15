#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include "libasm.h"

int main(void)
{
	char *frog = "frog";
	char frorg[5];
	printf("Length of 'frog' is: %zu\n", ft_strlen("frog"));
	printf("string to be copied: %s\n", frog);
	char *retval = ft_strcpy(&frorg[0], frog);
	printf("string to be copied after copying: %s\n", frog);
	printf("copied string: %s\n", frorg);
	printf("Pointer to original string: %p\n", frog);
	printf("Pointer to copied string: %p\n", frorg);
	printf("Return value of strcpy: %p\n", retval);
	int write_ret = ft_write(1, "This was written with ft_write\n", ft_strlen("This was written with ft_write\n"));
	printf("Length of printed string: %zu\n", ft_strlen("This was written with ft_write\n"));
	printf("Return value of ft_write: %d\n", write_ret);
	printf("Return value of failed ft_write: %zd\n", ft_write(123456789, "f", 1));
	perror("perror: ft_write");
	int fd = open("testfile.txt", O_RDWR);
	char buf[5] = "\0\0\0\0\0";
	int read_ret = ft_read(fd, buf, 5);
	printf("Value read with ft_read (trying to read 5 bytes), from testfile.txt: %s\n", buf);
	printf("Return value of that ft_read: %d\n", read_ret);
	open("frongus", O_RDONLY);
	perror("perror after reading file that doesnt exist (to change the errno after ft_write)");
	printf("Return value of failed ft_read: %zd\n", ft_read(111111111, buf, 1));
	perror("perror: ft_read");
	char *copy = ft_strdup("phrog");
	printf("ft_strdup return for copying string 'phrog' is: %s\n", copy);
	free(copy);
	copy = ft_strdup("abcdefghijklmnopqrstuvwxyz");
	printf("ft_strdup return for copying string 'abcdefghijklmnopqrstuvwxyz' is: %s\n", copy);
	free(copy);
	printf("ft_strcmp of 'frog' and 'frog': %d\n", ft_strcmp("frog", "frog"));
	printf("strcmp of 'frog' and 'frog': %d\n", strcmp("frog", "frog"));

	printf("ft_strcmp of 'frog' and 'frog1': %d\n", ft_strcmp("frog", "frog1"));
	printf("strcmp of 'frog' and 'frog1': %d\n", strcmp("frog", "frog1"));

	printf("ft_strcmp of 'frog1' and 'frog': %d\n", ft_strcmp("frog1", "frog"));
	printf("strcmp of 'frog1' and 'frog': %d\n", strcmp("frog1", "frog"));

	printf("ft_strcmp of 'frog1' and 'frog2': %d\n", ft_strcmp("frog1", "frog2"));
	printf("strcmp of 'frog1' and 'frog2': %d\n", strcmp("frog1", "frog2"));

	printf("Note that this is okay, since the behaviour of strcmp is defined as returning a value less than, equal to, or greater than 0, rather than a specific value\n");

	return (0);
}