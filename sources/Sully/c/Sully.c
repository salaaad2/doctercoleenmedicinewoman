#include <fcntl.h> 
#include <unistd.h> 
#include <stdio.h> 
#include <stdlib.h> 
 #define NEXT "Sully_%d.c"
 #define TEXT "#include <fcntl.h> %c#include <unistd.h> %c#include <stdio.h> %c#include <stdlib.h> %c #define NEXT %cSully_%cd.c%c%c #define TEXT %c%s%c%c int main(void) {char name[96]; char buf[96]; int fd;%c int n = %d; %c if (n < 0) {return (0);} sprintf(name, NEXT, n); fd = open(name, O_RDWR | O_CREAT, 0644); dprintf(fd, TEXT, 10, 10, 10, 10, 34, 37, 34, 10, 34, TEXT,34, 10, 10, (n - 1), 10, 34, 37, 37, 37, 34, 10); close(fd); sprintf(buf, %cgcc ./%cs -o %c.7s ; ./%c.7s%c, name, name,name); system(buf); return 0;}%c"
 int main(void) {char name[96]; char buf[96]; int fd;
 int n = 5;
 if (n < 0) {return (0);} sprintf(name, NEXT, n); fd = open(name, O_RDWR | O_CREAT, 0644); dprintf(fd, TEXT, 10, 10, 10, 10, 34, 37, 34, 10, 34, TEXT,34, 10, 10, (n - 1), 10, 34, 37, 37, 37, 34, 10); close(fd); sprintf(buf, "gcc ./%s -o %.7s ; ./%.7s", name, name,name); system(buf); return 0;}
