#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
/*cool*/
# define NEXT "Sully_%d.c"
# define TEXT "#include <fcntl.h>%c#include <unistd.h>%c#include <stdio.h>%c/*cool*/%c# define COOLKID %cGrace_kid.c%c%c# define TEXT %c%s%c%c# define GRACE() int main(void) {int fd = open(COOLKID, O_RDWR | O_CREAT, 0644); dprintf(fd, TEXT, 10,10,10,10,34,34,10,34,TEXT,34,10,10,10); close(fd); return 0;}%cGRACE()%c"
int
main(int ac, char *av[], char * envp[])
{
    char name[96];
    char buf[96];
    int fd;
    int n = 5;

    sprintf(name, NEXT, (n - 1));
    fd = open(name, O_RDWR | O_CREAT, 0644);
    dprintf(fd, TEXT, 10,10,10,10,34,34,10,34,TEXT,34,10,10,10);
    close(fd);
    sprintf(buf, "clang ./%s -o Sully_4", name);
    printf("%s\n", buf);
    execve(buf, NULL, envp);
    return 0;
}
