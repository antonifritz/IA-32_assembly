.global _start

.bss

bufor: .space 1

.text

_start:

mov $3, %eax
mov $0, %ebx
mov $bufor, %ecx
mov $1, %edx
int $0x80

cmp $0, %eax        #w eax zwrócona ilość bajtów funkcji read
je koniec

mov (%ecx), %eax
rol $4, %al
mov %eax, (bufor)

mov $4, %eax
mov $1, %ebx
mov $bufor, %ecx
mov $1, %edx
int $0x80
jmp _start

koniec:
mov $1, %eax
mov $0, %ebx
int $0x80
