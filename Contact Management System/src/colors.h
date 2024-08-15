// colors.h

#ifndef COLORS_H
#define COLORS_H

#include <stdio.h>

// Text colors
void red()       { printf("\033[0;31m"); }
void green()     { printf("\033[0;32m"); }
void yellow()    { printf("\033[0;33m"); }
void blue()      { printf("\033[0;34m"); }
void magenta()   { printf("\033[0;35m"); }
void cyan()      { printf("\033[0;36m"); }
void white()     { printf("\033[0;37m"); }

// Bold text colors
void bold_red()       { printf("\033[1;31m"); }
void bold_green()     { printf("\033[1;32m"); }
void bold_yellow()    { printf("\033[1;33m"); }
void bold_blue()      { printf("\033[1;34m"); }
void bold_magenta()   { printf("\033[1;35m"); }
void bold_cyan()      { printf("\033[1;36m"); }
void bold_white()     { printf("\033[1;37m"); }

// Italic text colors
void italic_red()     { printf("\033[3;31m"); }
void italic_green()   { printf("\033[3;32m"); }
void italic_yellow()  { printf("\033[3;33m"); }
void italic_blue()    { printf("\033[3;34m"); }
void italic_magenta() { printf("\033[3;35m"); }
void italic_cyan()    { printf("\033[3;36m"); }
void italic_white()   { printf("\033[3;37m"); }

// Text reset
void reset()    { printf("\033[0m"); }

#endif // COLORS_H
