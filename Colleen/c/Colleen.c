#include <stdio.h>
void hello(){}
/*
  hello
*/
int main(){char*c="#include <stdio.h>%cvoid hello(){}%c/*%c  hello%c*/%cint main(){char*c=%c%s%c;printf(c,10,10,10,10,10,34,c,34,10,10,10,10,10);hello();%c/*%c  hello%c*/%creturn 0;}%c";printf(c,10,10,10,10,10,34,c,34,10,10,10,10,10);hello();
/*
  hello
*/
return 0;}
