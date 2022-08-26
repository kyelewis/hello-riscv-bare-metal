GCC=riscv64-none-elf-gcc
AS=riscv64-none-elf-as
LD=riscv64-none-elf-ld
OBJCOPY=riscv64-none-elf-objcopy

rm -rf out/*

#$GCC -c src/kernel.c \
#  -mcmodel=medany \
#  -o out/kernel.o \
#  -nostdlib \
#  -ffreestanding \

$AS src/boot.S \
  -o out/boot.o \

$LD out/boot.o \
  -o out/kernel.elf \
  -T src/linker.lds

$OBJCOPY -D out/kernel.elf -O binary out/kernel.bin
