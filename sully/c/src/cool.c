#include <fcntl.h> 
#include <unistd.h> 
#include <stdio.h> 
#include <stdlib.h> 
#define NEXT "Sully_%d.c"
#define TEXT "#include <fcntl.h> %c#include <unistd.h> %c#include <stdio.h> %c#include <stdlib.h> %c\
#define NEXT %cSully_\%d.c%c%c \
#define TEXT %c%s%c%c                           \
 int main(void) { \
char name[96]; \
char buf[96]; \
int fd; \
int n = %d; \
sprintf(name, NEXT, (n - 1)); \
fd = open(name, O_RDWR | O_CREAT, 0644); \
dprintf(fd, TEXT, 10, 10, 10, 10, 34, (n - 1), 34, 10, 34, TEXT,34, 10, (n - 1), 34, 37, 37, 37, 34, 10); \
close(fd); \
sprintf(buf, %cclang ./%cs -o %c.7s ; ./%c.7s%c, name, name,name); \
system(buf); \
return 0; \
}%c"

int main(void) {     char name[96];
    char buf[96];
    int fd;
    int n = 5;
    sprintf(name, NEXT, (n - 1));
    fd = open(name, O_RDWR | O_CREAT, 0644);
    dprintf(fd, TEXT, 10, 10, 10, 10, 34, (n - 1), 34, 10, 34, TEXT,34, 10, (n - 1), 34, 37, 37, 37, 34, 10);
    close(fd);
    sprintf(buf, "clang ./%s -o %.7s ; ./%.7s", name, name,name);
    system(buf);
    return 0;
}
