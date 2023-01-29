bitrev:
        movq    %rdi, %rax

        movq    %rax, %rsi
        movabsq $0xAAAAAAAAAAAAAAAA, %rcx
        andq    %rcx, %rax
        shrq    %rax
        salq    %rsi
        andq    %rcx, %rsi
        addq    %rsi, %rax

        movq    %rax, %rsi
        movabsq $0xCCCCCCCCCCCCCCCC, %rcx
        andq    %rcx, %rax
        shrq    $2, %rax
        salq    $2, %rsi
        andq    %rcx, %rsi
        addq    %rsi, %rax

        movq    %rax, %rsi
        movabsq $0xF0F0F0F0F0F0F0F0, %rcx
        andq    %rcx, %rax
        shrq    $4, %rax
        salq    $4, %rsi
        andq    %rcx, %rsi
        addq    %rsi, %rax

        movq    %rax, %rsi
        movabsq $0xFF00FF00FF00FF00, %rcx
        andq    %rcx, %rax
        shrq    $8, %rax
        salq    $8, %rsi
        andq    %rcx, %rsi
        addq    %rsi, %rax

        movq    %rax, %rsi
        movabsq $0xFFFF0000FFFF0000, %rcx
        andq    %rcx, %rax
        shrq    $16, %rax
        salq    $16, %rsi
        andq    %rcx, %rsi
        addq    %rsi, %rax

        movq    %rax, %rsi
        shrq    $32, %rsi
        salq    $32, %rax
        addq    %rsi, %rax
        ret
