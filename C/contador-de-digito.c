#include <stdio.h>

int main()
{
  int count = 0;
  long int num, aux;

  scanf("%ld", &num);

  aux = num;

  while (1)
  {
    aux /= 10;
    count++;

    if (aux == 0)
    {
      break;
    }
  }

  printf("O numero %ld possui %d digito(s)\n", num, count);

  return 0;
}
