#include <stdio.h>

/*
 *hiii
 */

int main(void) {
    int i;
    int size = 20;

    i = 0;
    char * arr[] = {
"#include <stdio.h>",
"",
"/*",
" *hiii",
" */",
"",
"int main(void) {",
"    int i;",
"",
"    i = 0;",
"    char * arr[] = {",
"",
"    };",
"",
"    /*",
"     *helloooo",
"     */",
"i = 0;",
"while (i < 6) {",
"    write(1, arr[i], strlen(arr[i]));",
"    i++;",
"}",
"i = 6;",
"while (i < size) {",
"    write(1, arr[19], strlen(arr[i]));",
"    write(1, arr[i], strlen(arr[i]));",
"    write(1, arr[19], strlen(arr[i]));",
"    i++;",
"}",
"i = ;",
"while (i < size) {",
"    write(1, arr[i], strlen(arr[i]));",
"    i++;",
"}",
"    return 0;",
"}",
"\"",
   };
    /*",
     *helloooo
     */
    i = 0;
    while (i < 6) {
        write(1, arr[i], strlen(arr[i]));
        i++;
    }
    i = 6;
    while (i < size) {
        write(1, arr[19], strlen(arr[i]));
        write(1, arr[i], strlen(arr[i]));
        write(1, arr[19], strlen(arr[i]));
        i++;
    }
    i = ;
    while (i < size) {
        write(1, arr[i], strlen(arr[i]));
        i++;
    }
    return 0;
}
