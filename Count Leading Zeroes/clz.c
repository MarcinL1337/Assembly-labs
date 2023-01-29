#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <limits.h>

int clz(uint64_t t)
{
    t |= t >> 1;
    t |= t >> 2;
    t |= t >> 4;
    t |= t >> 8;
    t |= t >> 16;
    t |= t >> 32;

    uint64_t y = 0x5555555555555555;
    t = (t & y) + ((t >> 1) & y);
    y = 0x3333333333333333;
    t = (t & y) + ((t >> 2) & y);
    y = 0x0F0F0F0F0F0F0F0F;
    t = (t & y) + ((t >> 4) & y);
    y = 0x00FF00FF00FF00FF;
    t = (t & y) + ((t >> 8) & y);
    y = 0x0000FFFF0000FFFF;
    t = (t & y) + ((t >> 16) & y);
    y = 0x00000000FFFFFFFF;
    t = (t & y) + ((t >> 32) & y);

    return 64 - t;
}

int main()
{
    uint64_t x = 3;

    printf("%d", clz(x));
}
