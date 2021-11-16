#include <unistd.h>
#include <string.h>

/*
*hiii
*/

int main(void) {
int i;
int size = 36;

i = 0;
char * arr[] = {
"#include <unistd.h>",
"#include <string.h>",
"",
"/*",
" *hiii",
" */",
"",
"int main(void) {",
"int i;",
"",
"    char * arr[] = {",
"",
"    };",
"",
"    /*",
"     *helloooo",
"     */",
"i = 0;",
"while (i < 10) {",
"write(1, arr[i], 1);",
"i++;",
"}",
"i = 6;",
"while (i < size) {",
"write(1, arr[19], 1);",
"write(1, arr[i], strlen(arr[i]));",
"write(1, arr[19], 1);",
"i++;",
"}",
"i = 17;",
"while (i < size) {",
"write(1, arr[i], 1);",
"i++;",
"}",
"    return 0;",
"}",
"\"",
"\n",
",",
};
/*",
*helloooo
*/
i = 0;
while (i < 10) {
write(1, arr[i], strlen(arr[i]));
write(1, arr[37], 1);
i++;
}
i = 0;
while (i < size) {
write(1, arr[36], 1);
write(1, arr[i], strlen(arr[i]));
write(1, arr[36], 1);
write(1, arr[38], 1);
write(1, arr[37], 1);
i++;
}
i = 17;
while (i < size) {
write(1, arr[i], strlen(arr[i]));
write(1, arr[37], 1);
i++;
}
return 0;
}
