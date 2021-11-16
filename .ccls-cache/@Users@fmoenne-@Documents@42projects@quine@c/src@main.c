#include <stdio.h>

/*
 *hiii
 */

int main(void) {
    int i;

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
"    i = 0;",
"    while (i < 6) {",
"        printf(\"%s\\n\", arr[i]);",
"        i++;",
"    }",
"    i = 0;",
"    while (i < 21) {",
"        printf(\"\"%s\"\n\", arr[i]);",
"        i++;",
"    }",
"    i = 6;",
"    while (i < 21) {",
"        printf(\"%s\n\", arr[i]);",
"        i++;",
"    }",
"    return 0;",
"}",
   };
    /*",
     *helloooo
     */
    i = 0;
    while (i < 6) {
        printf("%s\n", arr[i]);
        i++;
    }
    i = 0;
    while (i < 21) {
        printf("\"%s\"\n", arr[i]);
        i++;
    }
    i = 6;
    while (i < 21) {
        printf("%s\n", arr[i]);
        i++;
    }
    return 0;
}
