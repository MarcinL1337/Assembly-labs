#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint64_t addsb(uint64_t x, uint64_t y)
{
    uint64_t mask1, mask2;
    mask1 = 0x7F7F7F7F7F7F7F7F;
    mask2 = 0x8080808080808080;

    uint64_t x1 = x & mask1;
    uint64_t y1 = y & mask1;

    uint64_t temp_res = x1 + y1;

    uint64_t x_signs = x & mask2;
    uint64_t y_signs = y & mask2;

    uint64_t temp_res_signs = temp_res & mask2;

    uint64_t ouflows = (~(x_signs ^ y_signs)) & (temp_res_signs ^ x_signs); // jedynki tam, gdzie nastąpił over/underflow

    uint64_t underflows = ouflows & x_signs;
    uint64_t overflows = underflows ^ ouflows;

    ouflows |= ouflows >> 1;        //1100 0000
    ouflows |= ouflows >> 2;        //1111 0000
    ouflows |= ouflows >> 4;        //1111 1111

    overflows >>= 1;
    overflows |= overflows >> 1;
    overflows |= overflows >> 2;
    overflows |= overflows >> 3;

    uint64_t temp = x_signs ^ y_signs;

    return underflows + overflows + (~ouflows & (temp_res ^ temp));


}

int main()
{
    printf("%llX\n", addsb(0x207f01807f7f7f7f, 0x01fffffffcfdfeff));
    printf("%llX\n", addsb(0x1ee71c55807f807f, 0x628262627f807f80));
    printf("%llX\n", addsb(0xdeadc0de00000000, 0xbeef133712345678));
    //printf("%llX\n", addsb(0x80808080f00dcafe, 0x1234567890909090));
    //printf("%llX\n", addsb(0xea7631eaa98e0945, 0xb2e4bdb37563d3cd));
}
