#include <stdio.h>

int main(int argc, char *argv[]) {
  FILE *fp = fopen(argv[1], "rb");
  unsigned char byte;

  while(fread(&byte, sizeof(byte), 1, fp)) {
    if(byte >= 0x30 && byte <= 0x39)
    printf("%c", byte);
  }

  printf("\n");
  fclose(fp);

  return 0;
}

// to run: ./pega_string_numero programinha
