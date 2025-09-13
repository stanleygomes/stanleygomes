Algoritmo "AnalisePrecosCestaBasica"

Var
  nome_produto1: caractere
  preco_anterior_produto1: real
  preco_atual_produto1: real
  variacao_produto1: real
  situacao_produto1: caractere

  nome_produto2: caractere
  preco_anterior_produto2: real
  preco_atual_produto2: real
  variacao_produto2: real
  situacao_produto2: caractere

  nome_produto3: caractere
  preco_anterior_produto3: real
  preco_atual_produto3: real
  variacao_produto3: real
  situacao_produto3: caractere

Inicio
  Escreva ("Digite o nome do produto 1:")
  Leia (nome_produto1)
  Escreva ("Digite o preco no mes anterior:")
  Leia (preco_anterior_produto1)
  Escreva ("Digite o preco no mes atual:")
  Leia (preco_atual_produto1)

  Escreva ("Digite o nome do produto 2:")
  Leia (nome_produto2)
  Escreva ("Digite o preco no mes anterior:")
  Leia (preco_anterior_produto2)
  Escreva ("Digite o preco no mes atual:")
  Leia (preco_atual_produto2)

  Escreva ("Digite o nome do produto 3:")
  Leia (nome_produto3)
  Escreva ("Digite o preco no mes anterior:")
  Leia (preco_anterior_produto3)
  Escreva ("Digite o preco no mes atual:")
  Leia (preco_atual_produto3)

  // calculo do primeiro produto
  variacao_produto1 <- ((preco_atual_produto1 - preco_anterior_produto1) / preco_anterior_produto1) * 100
  Se variacao_produto1 > 0 Entao
   situacao_produto1 <- "AUMENTO"
Senão
   Se variacao_produto1 < 0 Entao
      situacao_produto1 <- "QUEDA"
   Senão
      situacao_produto1 <- "ESTAVEL"
   FimSe
FimSe

  // calculo do segundo produto
  variacao_produto2 <- ((preco_atual_produto2 - preco_anterior_produto2) / preco_anterior_produto2) * 100
  Se variacao_produto2 > 0 Entao
   situacao_produto2 <- "AUMENTO"
Senão
   Se variacao_produto2 < 0 Entao
      situacao_produto2 <- "QUEDA"
   Senão
      situacao_produto2 <- "ESTAVEL"
   FimSe
FimSe

  // calculo do terceiro produto
  variacao_produto3 <- ((preco_atual_produto3 - preco_anterior_produto3) / preco_anterior_produto3) * 100
  Se variacao_produto2 > 0 Entao
   situacao_produto2 <- "AUMENTO"
Senão
   Se variacao_produto2 < 0 Entao
      situacao_produto2 <- "QUEDA"
   Senão
      situacao_produto2 <- "ESTAVEL"
   FimSe
FimSe

  // resultados

  Escreva ("Produto:", nome_produto1, "\n")
  Escreva ("Preco anterior: R$", preco_anterior_produto1, "\n")
  Escreva ("Preco atual: R$", preco_atual_produto1, "\n")
  Escreva ("Variacao percentual: ", variacao_produto1, "% \n")
  Escreva ("Situacao: ", situacao_produto1, "\n")
  Se (variacao_produto1 > 10) e (variacao_produto1 = "AUMENTO") Entao
    Escreva ("Sinal de abuso: Aumento superior a 10%!", "\n")
  FimSe
  Escreva ("\n")

  Escreva ("Produto:", nome_produto2, "\n")
  Escreva ("Preco anterior: R$", preco_anterior_produto2, "\n")
  Escreva ("Preco atual: R$", preco_atual_produto2, "\n")
  Escreva ("Variacao percentual: ", variacao_produto2, "%", "\n")
  Escreva ("Situacao: ", situacao_produto2, "\n")
  Se (variacao_produto2 > 10) e (variacao_produto2 = "AUMENTO") Entao
    Escreva ("Sinal de abuso: Aumento superior a 10%!", "\n")
  FimSe
  Escreva ("")

  Escreva ("Produto:", nome_produto3, "\n")
  Escreva ("Preco anterior: R$", preco_anterior_produto3, "\n")
  Escreva ("Preco atual: R$", preco_atual_produto3, "\n")
  Escreva ("Variacao percentual: ", variacao_produto3, "% \n")
  Escreva ("Situacao: ", situacao_produto3, "\n")
  Se (variacao_produto3 > 10) e (situacao_produto3 = "AUMENTO") Entao
    Escreva ("Sinal de abuso: Aumento superior a 10%!", "\n")
  FimSe

FimAlgoritmo
