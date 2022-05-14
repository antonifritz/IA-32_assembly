byte_count = 4
all_bits_count = 8 * byte_count
first_bit_count = all_bits_count - 3

.global _start

.bss

adres: .space byte_count

.text

_start:

mov $adres, %eax
mov $0, %edi

set_true_loop:

movb $0xFF, (%eax, %edi, 1)   #ustawienie bitów na true
inc %edi
cmp $byte_count, %edi
jl set_true_loop


mov $all_bits_count, %ecx     #wpisanie liczby bitów do rejestru ecx

mov $first_bit_count, %ebx
mov $first_bit_count, %esi    #rejestr esi przechowuje i
mov $2, %edi                  #rejestr edi przechowuje j

mov $0, %edx


outer_loop:

sub %edi, %esi

inner_loop:

btr %esi, (%eax)             #ustawienie indeksu i na false
sub %edi, %esi               #zmniejszenie i o j

cmp $0, %esi                 #warunek pętli wewnętrznej
jge inner_loop

inc %edi                     #zwiekszamy j
dec %ebx
mov %ebx, %esi  
cmp $8, %edi                 #warunek pętli zewnętrznej
jl outer_loop




mov $4, %eax
mov $1, %ebx
mov $adres, %ecx
mov $byte_count, %edx        #wypisanie wszystkich bajtów pod adresem
int $0x80

mov $1, %eax
mov $0, %ebx
int $0x80
