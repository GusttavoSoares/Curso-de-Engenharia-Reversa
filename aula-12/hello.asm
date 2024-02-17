; # apt install nasm
; $ nasm -f elf32 hello.asm
; $ ld -m elf_i386 -o hello hello.o
; $ ./hello

; código disponível em https://www.mentebinaria.com.br/forums/topic/51-%E2%80%9Chello-world%E2%80%9D-em-nasm-no-linux-x86/

; para entender, lembrar da syscall write https://en.wikipedia.org/wiki/Write_(system_call)
 
    section .rodata              ; seção .rodata do ELF, onde ficam os dados somente-leitura
msg: db "Mente Binária", 10      ; nossa string que será impressa, seguida de um \n
len: equ $-msg                   ; "$" significa "aqui" -> posição atual menos posição do texto. len terá o tamanho da string. (len: equ -> define o valor de "len" como o comprimento, em bytes, da string msg
 
    section .text                ; seção .text do ELF, onde fica o código
global _start                    ; faz o label "_start" visível ao linker (ld)

_start:
    mov edx,len                  ; arg3 da syscall write(), quantidade de bytes para imprimir (tamanho)
    mov ecx,msg                  ; arg2, pointeiro para o endereço da string
    mov ebx,1                    ; arg1, em qual file descriptor (fd) escrever. 1 é stdout
    mov eax,4                    ; 4 é o código da syscall write()
    int 0x80                     ; interrupção 0x80 do kernel (executa a syscall apontada em eax)
	 
    mov ebx,0                    ; arg1 da syscall exit(). 0 significa execução com sucesso
    mov eax,1                    ; 1 é o código da syscall exit()
    int 0x80                     ; executa a syscall apontada em eax, que vai sair do programa, 


; - explicação do int 0x80:
; int 0x80 é um interrupt, 0x80 é o valor dele. O interrupt transfere o fluxo do programa para qualquer um que lide com isso, nesse caso é o kernel, que faz as systemcalls

; 0x80 significa "program termination", desse modo, vai executar a syscall.

; o kernel é notificado sobre a systemcalls que o programa quer fazer examinando o valor no registro eax

; o valor 1, por exemplo, significa uma systemcall de exit(), já o valor 4 é o write().

; referência: https://stackoverflow.com/questions/1817577/what-does-int-0x80-mean-in-assembly-code
