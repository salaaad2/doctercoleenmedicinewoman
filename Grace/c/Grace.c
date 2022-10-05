#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
/*
  cool
*/
# define COOLKID "Grace_kid.c"
# define TEXT "#include <fcntl.h>%c#include <unistd.h>%c#include <stdio.h>%c/*%c  cool%c*/%c# define COOLKID %cGrace_kid.c%c%c# define TEXT %c%s%c%c# define GRACE() int main(void) {int fd = open(COOLKID, O_RDWR | O_CREAT, 0644); dprintf(fd, TEXT, 10,10,10,10,10,10,34,34,10,34,TEXT,34,10,10,10); close(fd); return 0;}%cGRACE()%c"
# define GRACE() int main(void) {int fd = open(COOLKID, O_RDWR | O_CREAT, 0644); dprintf(fd, TEXT, 10,10,10,10,10,10,34,34,10,34,TEXT,34,10,10,10); close(fd); return 0;}
GRACE()
