.global _start

_start:
    li t0, 0x10010000   # Load UART address to t0

restart:
    la a0, msg   # Load message address to a0

wait_ready:
    lw t2, 0(t0)            # Check if TX is ready 
    bltz t2, wait_ready     # If t2 is not positive yet, wait 

    lbu t1, (a0)            # load byte from a0 into t1
    beqz t1, end            # jump to end if the byte was zero

    sw t1, 0(t0)            # write byte to FIFO

    addi a0, a0, 1
    j wait_ready

end:
    j restart 

.section .rodata
msg:
  .string "Hello, RISC V!\r\n"
