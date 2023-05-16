#include <stdbool.h>
#define SECTOR_SIZE 512

asm(".code16\n");

__attribute__((section("__start")))
__attribute__((noreturn))
void main() {
    while(true) {
        ;
    }
}
