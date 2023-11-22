#include <stdio.h>

typedef struct lista
{
    int valor;
    struct lista *proximo;
} lista;

lista *procurarValor(lista *pLista, int valor);

int main(void)
{
    lista m1, m2, m3;
    lista *resultado, *gancho = &m1;
    int valor;

    m1.valor = 5;
    m2.valor = 10;
    m3.valor = 15;

    m1.proximo = &m2;
    m2.proximo = &m3;
    m3.proximo = NULL;

    printf("Digite o valor da pesquisa: ");
    scanf("%i", &valor);

    resultado = procurarValor(gancho, valor);

    if (resultado == NULL)
    {
        printf("Valor nao encontrado. \n");
    }
    else
    {
        printf("Valor %i encontrado no endereco %p\n", resultado->valor, resultado);
    }
}

lista *procurarValor(lista *pLista, int valor)
{
    while (pLista != NULL)
    {
        if (pLista->valor == valor)
        {
            return pLista;
        }
        else
        {
            pLista = pLista->proximo;
        }
    }

    return NULL;
}