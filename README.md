**CUPSOS**<br>
  **CUPS OS is OS-like/shell-cmds program that can run on any of Windows/NT or POSIX/UNIX-OSs, where the shell-cmds in lua and the kernel is writen in C**<br>
**TIPS**<br>
  *you don't need to compile the kernel.c if you did make changes in the shell-scripts as it can run even when the CUPS OS is already runing*<br>
  **BUT** *if you did make changes in the kernel.c you'll need to compile it again*<br>

**HOW TO RUN CUPS OS**
 *as for the official release the method to run CUPS OS is by writen in the dir ./Boot-COS for UNIX-OSs and .\Boot-COS.exe for Windows*
 **BUT** *if you compiled it you can put the name that you want by writen using:
 GCC in UNIX-OSs: `gcc kernel.c -o NAME -llua`,
 CLANG in UNIX-OSs: `clang kernel.c -o NAME -llua`,
 GCC in Windows: `gcc kernel.c -o NAME.exe -llua`,
 CLANG in Windows: `gcc kernel.c -o NAME.exe -llua`,*
 
***CUPS OS by CUPS STUDIO***
