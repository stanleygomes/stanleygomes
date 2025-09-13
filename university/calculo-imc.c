#include <stdio.h>

int main() {
    printf("\n--- Calculadora de IMC (Indice de Massa Corporal) ---\n");
    printf("Este programa calcula o IMC de uma ou mais pessoas.\n");

    char continuar;
    float peso, altura, imc, soma_imc = 0.0;
    int qtdImc = 0;

    // loop que vai permitir repetir todo o processo de calculo de imc para varias pessoas
    do {
        printf("\nDigite o peso em kg (ex.: 75): ");
        scanf("%f", &peso);

        printf("Digite a altura em metros (ex.: 1.75): ");
        scanf("%f", &altura);

        // validar pesos inseridos errado
        if (peso <= 0 || altura <= 0) {
            printf("Valores de peso e altura devem ser maiores que zero. Tente novamente.\n\n");
            continue;
        }

        // calcular e mostrar imc
        imc = peso / (altura * altura);
        printf("\nSeu IMC e: %.2f\n", imc);

        // classificar o imc de acordo com a tabela
        if (imc < 18.5) {
            printf("Classificacao: Abaixo do peso\n");
        } else if (imc >= 18.5 && imc <= 24.9) {
            printf("Classificacao: Peso normal\n");
        } else if (imc >= 25.0 && imc <= 29.9) {
            printf("Classificacao: Excesso de peso\n");
        } else if (imc >= 30.0 && imc <= 34.9) {
            printf("Classificacao: Obesidade grau I\n");
        } else if (imc >= 35.0 && imc <= 39.9) {
            printf("Classificacao: Obesidade grau II\n");
        } else {
            printf("Classificacao: Obesidade grau III\n");
        }

        // somando o IMC para a media total
        soma_imc += imc;
        qtdImc++;

        // validar se termina o programa ou repete o processo
        printf("\nDeseja calcular o IMC de outra pessoa? (s/n): ");
        scanf(" %c", &continuar);
    } while (continuar == 's' || continuar == 'S');

    // calculo da media geral
    if (qtdImc > 0) {
        float media_imc = soma_imc / qtdImc;
        printf("--- Resultado Final ---\n");
        printf("Foram calculados %d IMCs.\n", qtdImc);
        printf("A media geral dos IMCs calculados e: %.2f\n", media_imc);
    } else {
        printf("Nenhum IMC foi calculado.\n");
    }

    printf("\nPrograma encerrado. Ate mais!\n");

    return 0;
}
