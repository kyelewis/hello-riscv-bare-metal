qemu-system-riscv32 \
  -kernel out/kernel.bin \
  -machine sifive_u \
  -monitor stdio \
  -m 16K
