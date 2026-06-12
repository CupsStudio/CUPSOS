#include <stdlib.h>
#include <stdio.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <string.h>
#include <unistd.h>

#define COS_MAX_SIZE 300 // CUPS OS MAX SIZE

int main()
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);   

    printf("\033[90m       .-------------------------.                               \n");
    printf("\033[90m      /                           \\                              \n");
    printf("\033[90m     |   \033[30m_______________________   \033[90m|                             \n");
    printf("\033[90m     |  \033[30m/                       \\  \033[90m|                             \n");
    printf("\033[90m  \033[30m.  \033[90m| \033[30m|                         | \033[90m|                             \n");
    printf("\033[30m / \\ \033[90m| \033[30m|                         | \033[90m|                             \n");
    printf("\033[30m|   |\033[90m| \033[30m|                         | \033[90m|    \033[97m██████   ██████    \n");
    printf("\033[30m \\ / \033[90m| \033[30m|     \033[38;5;51m================    \033[30m| \033[90m|   \033[97m██    ██ ██         \n");
    printf("\033[30m  '  \033[90m|  \033[30m\\_______________________/  \033[90m|   \033[97m██    ██  ██████    \n");
    printf("\033[90m     |                             |   \033[97m██    ██       ██   \n");
    printf("\033[90m     |          \033[30m_________          \033[90m|    \033[97m██████   ██████  \033[38;5;51m● \n");
    printf("\033[90m     |         \033[30m/        /          \033[90m|                             \n");
    printf("\033[90m      \\       \033[30m/________/          \033[90m/                              \n");
    printf("\033[90m       '-------------------------'                               \n");
    printf("\033[38;5;51m        CUPS OS Alpha v0.4 \033[0m\n\n");

    char welcome[COS_MAX_SIZE] = "CUPS OS Alpha v0.4\n"; // Added newline
    printf("%s", welcome);

    char input[COS_MAX_SIZE];

    // Added a loop so your shell stays alive until you type "exit"
    while (1) {
        char COS[COS_MAX_SIZE] = "COS> ";
        printf(COS);
        fflush(stdout); // CRITICAL: Forces the prompt to show up immediately

        if (fgets(input, sizeof(input), stdin) == NULL) {
            break; // Exit loop if EOF (Ctrl+Z or Ctrl+D) is detected
        }

        // Remove trailing newline
        input[strcspn(input, "\r\n")] = 0;

        if (strlen(input) > 0) {
            // Extract the first token (the command name)
            char *command = strtok(input, " ");
            
            //  Check for built-in exit command
            if (strcmp(command, "exit.exec") == 0) {
                printf("Shutting down CUPS OS...\n");
                break;
            }

            if (strcmp(command, "shutdown.exec") == 0) {
                printf("Shutting down CUPS OS...\n");
                break;
            }

            // Dynamically build the script path: "shell_scripts/[command].lua"
            char script_path[COS_MAX_SIZE + 20];
            snprintf(script_path, sizeof(script_path), "shell_scripts/%s.lua", command);

            // Create a global "arg" table in Lua to hold any arguments passed
            lua_newtable(L);
            int arg_index = 1;
            char *token = strtok(NULL, " "); // Get the next word after the space
            
            while (token != NULL) {
                lua_pushstring(L, token);
                lua_rawseti(L, -2, arg_index++); // Equivalent to: arg[arg_index] = token
                token = strtok(NULL, " ");
            }
            lua_setglobal(L, "arg"); // Name the table "arg" in Lua

            // Try running the script
            if (luaL_dofile(L, script_path) != 0) {
                // If the file doesn't exist or crashes, show this error
                printf("Unknown command or script error: %s\n", command);
                lua_pop(L, 1); // Clear the error message from the Lua stack
            }
        }
    }

    lua_close(L);
    return 0;
}
