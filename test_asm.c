#include <stdlib.h>

extern int ft_read(int, void *, int);
extern int ft_write(int, void *, int);
extern int ft_strcmp(char *, char *);
extern char *ft_strcpy(char *, char *);
extern char *ft_strdup(char *);
extern int ft_strlen(char *);

extern int printf(char *, ...);

int main(void)
{
	printf("Test 1: ft_strlen\n");
	printf("Length of 'asdasd': %d\n", ft_strlen("asdasd"));

	printf("\nTest 2: ft_strdup\n");
	char *duplicated_str = ft_strdup("Hello, World!");
	printf("Duplicate of 'Hello, World!': %s\n", duplicated_str);
	free(duplicated_str);

	printf("\nTest 3: ft_write\n");
	int n_written = ft_write(1, "asdasd:", 3);
	printf("\nBytes written by ft_write: %d\n", n_written);

	printf("\nTest 4: ft_strcmp\n");
	int comparison_result = ft_strcmp("asdasd:", "xsdasd:");
	printf("Comparison result between 'asdasd:' and 'xsdasd:': %d\n", comparison_result);

	printf("\nTest 5: ft_strcpy\n");
	char dest[50];
	ft_strcpy(dest, "Copied string!");
	printf("Destination string after ft_strcpy: %s\n", dest);

	printf("\nTest 6: ft_read\n");
	char buffer[128];
	int bytes_read = ft_read(0, buffer, sizeof(buffer) - 1);

	if (bytes_read > 0)
	{
		buffer[bytes_read] = '\0';
		printf("Data read from stdin: %s\n", buffer);
	}
	else
	{
		printf("No data read or an error occurred.\n");
	}

	return (0);
}

