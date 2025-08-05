# Clean architecture

Um modelo de arquitetura de software que organiza o código em camadas separadas por responsabilidades, priorizando a independência da lógica de negócio em relação a frameworks, bancos de dados e interfaces externas.

## DDD (Domain Driven Design)
O Domain-Driven Design (DDD) é uma abordagem de desenvolvimento de software que coloca o foco principal no domínio de negócio, modelando o software para refletir com precisão a lógica, as regras e os processos desse domínio em um modelo rico e coeso.

Construir regras fortes nas entidades, aproximando essas regras das entidades.

## POO – Programação Orientada a Objetos

### 🧱 O que é POO?

A Programação Orientada a Objetos (POO) é um paradigma de desenvolvimento que organiza o código em torno de **objetos**, que representam entidades do mundo real com propriedades (atributos) e comportamentos (métodos).

### Principais conceitos:

- **Classe:** Um "molde" ou estrutura que define os atributos e métodos de um objeto.
- **Objeto:** Instância concreta de uma classe; é quem realmente executa as ações.
- **Encapsulamento:** Proteger os dados internos do objeto, expondo apenas o necessário (usando, por exemplo, modificadores de acesso como `private` e métodos `get`/`set`).
- **Herança:** Permite que uma classe herde características (métodos e atributos) de outra, facilitando o reuso de código.
- **Polimorfismo:** Objetos diferentes podem ser tratados de forma genérica, permitindo múltiplas implementações para o mesmo método.
- **Abstração:** Focar apenas nos aspectos essenciais de uma entidade, escondendo detalhes complexos.

### 🤔 Por que usar POO?

- Facilita a organização e manutenção do código
- Permite reutilização de componentes
- Torna o sistema mais escalável e flexível para mudanças
- Ajuda a modelar problemas do mundo real de forma mais intuitiva

### 💡 Motivações

- Projetos grandes e complexos precisam de organização
- Equipes conseguem trabalhar em paralelo desenvolvendo diferentes objetos
- Testes unitários ficam mais simples e isolados
- Reduz acoplamento entre partes do sistema

### 🖥️ Exemplo simples em Java

```java
// classe base (abstração)
public class Animal {
    private String nome;

    public Animal(String nome) {
        this.nome = nome;
    }

    public void emitirSom() {
        this.print();
    }

    // encapsulamento: protegendo um atributo
    public String getNome() {
        return nome;
    }

    // encapsulamento: protegendo um metodo
    private void print() {
        System.out.println("Som genérico...");
    }
}

// Classe derivada (herança e polimorfismo)
public class Cachorro extends Animal {
    public Cachorro(String nome) {
        super(nome);
    }

    @Override
    public void emitirSom() {
        System.out.println("Au Au!");
    }
}

// Uso dos objetos
public class Main {
    public static void main(String[] args) {
        Animal animal1 = new Cachorro("Rex");
        animal1.emitirSom(); // Saída: Au Au!
    }
}
```

## SOLID

### 🧩 [S]ingle Responsibility Principle (SRP)

O Single Responsibility Principle (Princípio da Responsabilidade Única) é o primeiro dos princípios SOLID e diz que:

> **“Uma classe deve ter apenas um motivo para mudar.”** 🎯

Ou seja, cada classe, função ou módulo deve ser responsável por apenas uma coisa dentro do sistema. Se ela faz mais de uma coisa, pode ficar difícil de manter, testar e evoluir o código.

### Por que é importante? 🤔

- Facilita a manutenção 🛠️
- Deixa o código mais legível 📖
- Reduz o risco de bugs 🐞
- Torna o sistema mais flexível para mudanças 🔄

O objetivo não é criar um número absurdo de classes minúsculas, mas sim organizar o código de forma lógica, pensando em quem ou o quê motivaria uma mudança futura. Isso vai salvar muito tempo e dor de cabeça em qualquer projeto.

### 🚪 [O]pen/Closed Principle (OCP)

O Open/Closed Principle (Princípio Aberto/Fechado) é o segundo princípio do SOLID e diz que:

> **“Entidades de software devem ser abertas para extensão, mas fechadas para modificação.”** 🛡️✨

Ou seja, você deve conseguir adicionar novos comportamentos ao seu código sem precisar alterar o que já está funcionando. Isso deixa o sistema mais robusto e fácil de evoluir!

**Como aplicar? 🤔**

- Use **polimorfismo** para permitir que diferentes implementações sejam usadas de forma intercambiável 🦸‍♂️
- Utilize padrões de projeto como o **Strategy** para trocar comportamentos em tempo de execução 🧩

### 🧲 [L]iskov Substitution Principle (LSP)

O Liskov Substitution Principle (Princípio da Substituição de Liskov) diz que:

> **“Objetos de uma classe derivada devem poder substituir objetos da classe base sem alterar o funcionamento do programa.”** 🔄

Ou seja, subclasses devem manter o comportamento esperado da classe base. Se uma subclasse quebra alguma regra ou expectativa, pode causar bugs difíceis de encontrar.

**Por que é importante? 🤔**

- Garante a previsibilidade do sistema
- Facilita o uso de herança e polimorfismo
- Evita surpresas desagradáveis no código

### 🛡️ [I]nterface Segregation Principle (ISP)

O Interface Segregation Principle (Princípio da Segregação de Interface) diz que:

> **“Nenhum cliente deve ser forçado a depender de métodos que não utiliza.”** 🧩

Ou seja, é melhor ter várias interfaces pequenas e específicas do que uma interface grande e genérica. Isso torna o código mais limpo e fácil de manter.

**Como aplicar? 🤔**

- Crie interfaces focadas em responsabilidades específicas
- Evite interfaces “inchadas” com métodos desnecessários

### 🏗️ [D]ependency Inversion Principle (DIP)

O Dependency Inversion Principle (Princípio da Inversão de Dependência) diz que:

> **“Dependa de abstrações, não de implementações concretas.”** 🏗️

Ou seja, módulos de alto nível não devem depender de módulos de baixo nível, ambos devem depender de abstrações. Isso facilita testes, manutenção e evolução do sistema.

**Como aplicar? 🤔**

- Use interfaces ou classes abstratas para definir contratos
- Utilize injeção de dependência para conectar implementações
- implementar logica das apis
- quebrar o componente gigante em pedaços
- criar testes unitarios
