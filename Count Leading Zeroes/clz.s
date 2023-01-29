/*
 * UWAGA! W poniższym kodzie należy zawrzeć krótki opis metody rozwiązania
 *        zadania. Będzie on czytany przez sprawdzającego. Przed przystąpieniem
 *        do rozwiązywania zapoznaj się dokładnie z jego treścią. Poniżej należy
 *        wypełnić oświadczenie o samodzielnym wykonaniu zadania.
 *
 * Oświadczam, że zapoznałem(-am) się z regulaminem prowadzenia zajęć
 * i jestem świadomy(-a) konsekwencji niestosowania się do podanych tam zasad.
 *
 * Imię i nazwisko, numer indeksu: __________ __________, ______
 */

        .text
        .globl  clz
        

/*
 * W moim rozwiązaniu używam następującej techniki: ____ ____ ____ ____
 */

clz:
        movq %rdi, %rax

        movq %rdi, %rdx
        sarq %rdx
        orq  %rdx, %rax

        movq %rax, %rdx
        sarq $2, %rdx
        orq  %rdx, %rax

        movq %rax, %rdx
        sarq $4, %rdx
        orq  %rdx, %rax

        movq %rax, %rdx
        sarq $8, %rdx
        orq  %rdx, %rax

        movq %rax, %rdx
        sarq $16, %rdx
        orq  %rdx, %rax

        movq %rax, %rdx
        sarq $32, %rdx
        orq  %rdx, %rax

        notq %rax

        movabsq $0x5555555555555555, %r8
        movq %rax, %rdx
        andq %r8, %rax
        sarq %rdx
        andq %r8, %rdx
        addq %rdx, %rax

        movabsq $0x3333333333333333, %r8
        movq %rax, %rdx
        andq %r8, %rax
        sarq $2, %rdx
        andq %r8, %rdx
        addq %rdx, %rax

        movabsq $0x0F0F0F0F0F0F0F0F, %r8
        movq %rax, %rdx
        andq %r8, %rax
        sarq $4, %rdx
        andq %r8, %rdx
        addq %rdx, %rax

        movq %rax, %rdx
        sarq $8, %rdx
        addq %rdx, %rax

        movq %rax, %rdx
        sarq $16, %rdx
        addq %rdx, %rax

        movq %rax, %rdx
        sarq $32, %rdx
        addq %rdx, %rax
        
        andq $127, %rax
        ret