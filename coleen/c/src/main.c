#include <unistd.h>
#include <string.h>

/*
*hiii
*/

int main(void) {
int i;
int size = 42;

i = 0;
char * arr[] = {
"#include <unistd.h>",
"#include <string.h>",
"",
"/*",
"*hiii",
"*/",
"",
"int main(void) {",
"int i;",
"int size = 36;",
"",
"i = 0;",
"char * arr[] = {",
"\"",
"\n",
",",
"};",
"/*",
"*helloooo",
"*/",
"i = 0;",
"while (i < 10) {",
"write(1, arr[i], strlen(arr[i]));",
"write(1, arr[37], 1);",
"i++;",
"}",
"i = 0;",
"while (i < size) {",
"write(1, arr[36], 1);",
"write(1, arr[i], strlen(arr[i]));",
"write(1, arr[36], 1);",
"write(1, arr[38], 1);",
"write(1, arr[37], 1);",
"i++;",
"}",
"i = 17;",
"while (i < size) {",
"write(1, arr[i], strlen(arr[i]));",
"write(1, arr[37], 1);",
"i++;",
"}",
"return 0;",
"}",
"\"",
"\n",
",",
};
/*",
*helloooo
*/
i = 0;
while (i < 12) {
write(1, arr[i], strlen(arr[i]));
write(1, arr[44], 1);
i++;
}
i = 0;
while (i < size) {
write(1, arr[43], 1);
write(1, arr[i], strlen(arr[i]));
write(1, arr[43], 1);
write(1, arr[45], 1);
write(1, arr[44], 1);
i++;
}
i = 17;
while (i < size) {
write(1, arr[i], strlen(arr[i]));
write(1, arr[44], 1);
i++;
}
return 0;
}
