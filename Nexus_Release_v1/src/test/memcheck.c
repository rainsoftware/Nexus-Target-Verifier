#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s program [args...]\n", argv[0]);
        return 1;
    }

    char* program = argv[1];
    char** args = &argv[1];

    // Create the command line for valgrind
    char* valgrind_cmd[64] = {0};
    int valgrind_i = 0;
    valgrind_cmd[valgrind_i++] = "valgrind";
    valgrind_cmd[valgrind_i++] = "--leak-check=full";
    valgrind_cmd[valgrind_i++] = "--show-leak-kinds=all";
    valgrind_cmd[valgrind_i++] = program;

    // Append program arguments to the valgrind command
    for (int i = 1; i < argc; i++) {
        valgrind_cmd[valgrind_i++] = args[i];
    }
    valgrind_cmd[valgrind_i++] = NULL;

    // Run the command using execvp()
    if (execvp("valgrind", valgrind_cmd) < 0) {
        perror("Error executing valgrind command");
        return 1;
    }

    return 0;
}
