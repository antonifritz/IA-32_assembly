SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.global _start

.bss 

byte: .space 1

.text

_start:

loop:
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $byte, %ecx 
movl $1, %edx

int $0x80

cmp $0, %eax
je end

end:
movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80