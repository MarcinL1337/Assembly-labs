#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <limits.h>

uint64_t bitrev(uint64_t x)
{
    x = ((x & 0xAAAAAAAAAAAAAAAA) >>  1) + ((x & 0x5555555555555555) <<  1);
    x = ((x & 0xCCCCCCCCCCCCCCCC) >>  2) + ((x & 0x3333333333333333) <<  2);
    x = ((x & 0xF0F0F0F0F0F0F0F0) >>  4) + ((x & 0x0F0F0F0F0F0F0F0F) <<  4);
    x = ((x & 0xFF00FF00FF00FF00) >>  8) + ((x & 0x00FF00FF00FF00FF) <<  8);
    x = ((x & 0xFFFF0000FFFF0000) >> 16) + ((x & 0x0000FFFF0000FFFF) << 16);
    return ((x >> 32)+(x << 32));
}

int main()
{
    uint64_t x = 6029309553563065200;

    printf("%lld", bitrev(x));
}