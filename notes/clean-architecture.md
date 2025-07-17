# SOLID

## 🧩 [S]ingle Responsibility Principle (SRP)

O Single Responsibility Principle (Princípio da Responsabilidade Única) é o primeiro dos princípios SOLID e diz que:

> **“Uma classe deve ter apenas um motivo para mudar.”** 🎯

Ou seja, cada classe, função ou módulo deve ser responsável por apenas uma coisa dentro do sistema. Se ela faz mais de uma coisa, pode ficar difícil de manter, testar e evoluir o código.

### Por que é importante? 🤔

- Facilita a manutenção 🛠️
- Deixa o código mais legível 📖
- Reduz o risco de bugs 🐞
- Torna o sistema mais flexível para mudanças 🔄

O objetivo não é criar um número absurdo de classes minúsculas, mas sim organizar o código de forma lógica, pensando em quem ou o quê motivaria uma mudança futura. Isso vai salvar muito tempo e dor de cabeça em qualquer projeto.

## 🚪 [O]pen/Closed Principle (OCP)

O Open/Closed Principle (Princípio Aberto/Fechado) é o segundo princípio do SOLID e diz que:

> **“Entidades de software devem ser abertas para extensão, mas fechadas para modificação.”** 🛡️✨

Ou seja, você deve conseguir adicionar novos comportamentos ao seu código sem precisar alterar o que já está funcionando. Isso deixa o sistema mais robusto e fácil de evoluir!

### Como aplicar? 🤔

- Use **polimorfismo** para permitir que diferentes implementações sejam usadas de forma intercambiável 🦸‍♂️
- Utilize padrões de projeto como o **Strategy** para trocar comportamentos em tempo de execução 🧩
