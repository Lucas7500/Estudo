#include <stdio.h>

int main()
{
    int height = 8;

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < height; j++)
        {
            if (j < height - i - 1)
            {
                printf(" ");
            }
            else
            {
                printf("#");
            }
        }

        printf("  ");

        for (int j = 0; j < i + 1; j++)
        {
            {
                printf("#");
            }
        }

        printf("\n");
    }

    return 0;
}