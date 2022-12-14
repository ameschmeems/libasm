#ifndef LIBASM_H
# define LIBASM_H

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dst, char *src);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
int strcmp(const char *s1, const char *s2);

#endif