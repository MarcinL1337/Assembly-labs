        .data
        m1 : .quad 0x0F0F0F0F0F0F0F0F
        m2 : .quad 0x00000000000000FF
        m3 : .quad 136
        m4 : .quad 17
        .text
        .globl  mod17
        .type   mod17, @function

mod17:
        movq    %rdi, %rcx

        andq    m1, %rdi
        sarq    $4, %rcx
        andq    m1, %rcx

        mov     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al
        rorq    $8, %rdi
        add     %dil, %al

        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al
        rorq    $8, %rcx
        sub     %cl, %al

        xorq    %r9, %r9
        cmp     $0, %al
        cmovl   m3, %r9
        add     %r9b, %al

        movq    %rax, %rcx
        andq    m1, %rax
        sarq    $4, %rcx
        andq    m1, %rcx
        sub     %cl, %al
        
        xorq    %r9, %r9
        cmp     $0, %al
        cmovl   m4, %r9
        add     %r9b, %al

        andq    m2, %rax

        ret
