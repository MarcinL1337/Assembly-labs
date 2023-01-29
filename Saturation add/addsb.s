addsb:
        movabsq $0x7F7F7F7F7F7F7F7F, %rcx
        movabsq $0x8080808080808080, %rdx

        movq    %rdi, %rax
        andq    %rcx, %rax  /*x1*/
        andq    %rsi, %rcx  /*y1, %r10 wolne*/

        addq    %rcx, %rax  /*temp_res*/

        andq    %rdx, %rdi  /*x_signs*/
        andq    %rdx, %rsi  /*y_signs*/

        andq    %rax, %rdx  /*temp_res_signs*/

        movq    %rdi, %r10
        xorq    %rsi, %r10  /*temp*/

        xorq    %rdi, %rsi
        notq    %rsi
        xorq    %rdi, %rdx
        andq    %rdx, %rsi  /*ouflows, %rcx wolne*/

        andq    %rsi, %rdi  /*underflows*/
        
        movq    %rdi, %rcx
        xorq    %rsi, %rcx  /*overflows*/

        shrq    $7, %rsi
        leaq    (%rsi, %rsi, 2), %rsi
        leaq    (%rsi, %rsi, 4), %rsi
        movq    %rsi, %r8
        salq    $4, %r8
        orq     %r8, %rsi   /*ouflows, %r8 wolne*/
        notq    %rsi        /*~ouflows*/

        shrq    $7, %rcx
        leaq    (%rcx, %rcx, 2), %rcx
        leaq    (%rcx, %rcx, 4), %rcx
        movq    %rcx, %r8
        salq    $3, %r8
        orq     %r8, %rcx   /*overflows, %r8 wolne*/

        xorq    %r10, %rax
        andq    %rsi, %rax
        addq    %rcx, %rax
        addq    %rdi, %rax

        ret
