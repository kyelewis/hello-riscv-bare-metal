unsigned char * uart = (unsigned char *)0x10010000;

void kmain(void) {
  
  const char * str = "Kernel!\r\n";
  while(*str != '\0') {
      *uart = *str;
      str++;
  }

}

