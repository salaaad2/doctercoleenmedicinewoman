#include <fcntl.h>
 #include <unistd.h>
 #include <string.h>
 /*cool*/
 # define COOLKID "Grace_kid.c" # define TEXT "#include <fcntl.h>%c #include <unistd.h>%c #include <string.h>%c /*cool*/%c # define COOLKID %cGrace_kid.c%c # define TEXT %c%s%c%c # define GRACE() int main(void) {int fd = open(COOLKID, O_RDWR | O_CREAT, 0644); write(fd, COOLKID, strlen(COOLKID)); close(fd); return 0;}%cGRACE()"
 # define GRACE() int main(void) {int fd = open(COOLKID, O_RDWR | O_CREAT, 0644); write(fd, COOLKID, strlen(COOLKID)); close(fd); return 0;}
GRACE()