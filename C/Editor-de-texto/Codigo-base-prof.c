#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <conio.h>

#define CURSOR_ESCONDIDO 0
#define CURSOR_VISIVEL 1

//
#define MAX_POS_COL 80
#define MAX_POS_LIN 25

// Códigos ASCII de teclas direcionais
#define ID_SETAS 224
#define UP 72
#define DOWN 80
#define LEFT 75
#define RIGHT 77

#define INSERT 82
#define ENTER 13
#define SPACEBAR 32
#define BACKSPACE 8
#define ESC 27

void alterarEstadoDoCursor(const int estado)
{
    HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_CURSOR_INFO cci;
    GetConsoleCursorInfo(handle, &cci);
    cci.bVisible = estado; // estado = 0: escondido; estado = 1: visível
    SetConsoleCursorInfo(handle, &cci);
}

void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

void exibirPosColLin(int col, int lin)
{
    static int primeiraAparicao = 1;

    alterarEstadoDoCursor(CURSOR_ESCONDIDO);

    if (primeiraAparicao)
    {
        primeiraAparicao = 0;

        gotoxy(MAX_POS_COL - 30, MAX_POS_LIN);
        printf("Lin    Col");
    }

    gotoxy(MAX_POS_COL - 26, MAX_POS_LIN); // 54
    printf("%-2d", lin);

    gotoxy(MAX_POS_COL - 19, MAX_POS_LIN); // 61
    printf("%-3d", col);

    gotoxy(col, lin);
    alterarEstadoDoCursor(CURSOR_VISIVEL);
}

void exibirModoInsercaoSobrescrita(int estadoInsert)
{
    gotoxy(MAX_POS_COL - 11, MAX_POS_LIN);
    if (estadoInsert)
        printf("%-11s", "Insercao");
    else
        printf("%-11s", "Sobrescrita");
}

void checarLimitePosLin(int *lin, int maxLin)
{
    if (*lin < 0)
        *lin = 0;
    else if (*lin > maxLin)
        *lin = maxLin;
}

void checarLimitePosCol(int *col, int maxCol)
{
    if (*col < 0)
        *col = 0;
    else if (*col > maxCol)
        *col = maxCol;
}

int main()
{
    int tecla, movimentar = 1;
    int col = 0, lin = 0;
    int estadoTeclaInsert = 0;
    int maxLinPreenchida = 0;
    int l;

    // Matriz que guarda página única do Editor de Textos
    char matrizPagina[MAX_POS_LIN][MAX_POS_COL];

    exibirPosColLin(col, lin);
    exibirModoInsercaoSobrescrita(estadoTeclaInsert);

    gotoxy(0, MAX_POS_LIN);
    printf("Esc-Sair");

    gotoxy(col, lin);

    while (movimentar)
    {
        tecla = getch();
        // printf("%3d %c", tecla, tecla);

        switch (tecla)
        {
        case ID_SETAS:
            tecla = getch();
            switch (tecla)
            {
            case DOWN:
                lin++;
                checarLimitePosLin(&lin, MAX_POS_LIN - 1);
                gotoxy(col, lin);
                break;

            case UP:
                lin--;
                checarLimitePosLin(&lin, MAX_POS_LIN - 1);
                gotoxy(col, lin);
                break;

            case LEFT:
                col--;
                checarLimitePosCol(&col, MAX_POS_COL - 1);
                gotoxy(col, lin);
                break;

            case RIGHT:
                col++;
                checarLimitePosCol(&col, MAX_POS_COL - 1);
                gotoxy(col, lin);
                break;
            }
            break;

        case INSERT:
            estadoTeclaInsert = !estadoTeclaInsert;
            exibirModoInsercaoSobrescrita(estadoTeclaInsert);
            break;

        case ENTER:
            // Imprimir '\n'
            // Atualizar 'matrizPagina'
            col = 0;
            lin++;
            checarLimitePosLin(&lin, MAX_POS_LIN - 1);
            gotoxy(col, lin);
            break;

        case SPACEBAR:
            gotoxy(col, lin);
            printf(" ");
            matrizPagina[lin][col] = ' ';
            col++;
            checarLimitePosCol(&col, MAX_POS_COL - 1);
            gotoxy(col, lin);
            break;

        case BACKSPACE:
            // Remover caractere à direita
            // Atualizar 'matrizPagina'

            col--;
            checarLimitePosCol(&col, MAX_POS_COL - 1);
            gotoxy(col, lin);
            break;

        case ESC:
            movimentar = 0;
            break;

        default:; // TESTE TEMPORÁRIO
                  // Verificar se a tecla pressionada é um caractere imprimível
                  // Se o for:
                  // 1. Imprimi-lo
                  // 2. Atualizar 'matrizPagina'
                  // 3. Atualizar 'col'

        } // Fim switch
        exibirPosColLin(col, lin);
    } // Fim while

    // Apagamento da linha contendo informações gerais do "editor"
    for (col = 0; col < MAX_POS_COL; col++)
    {
        gotoxy(col, MAX_POS_LIN);
        printf(" ");
    }

    printf("\nCONTEUDO ARMAZENADO NA MATRIZ:\n");
    // Usar comando de repetição para imprimir o conteúdo de 'matrizPagina'

    system("pause > nul");
}
