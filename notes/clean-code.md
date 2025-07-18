# 🧹 Clean Code

## ✍️ Nomes e Propósito
- Crie nomes de classes, métodos e variáveis que definam o propósito e deixem claro o significado.
```java
// Ruim
int a;
// Bom
int quantidadeDeItens;
```

## 📏 Tamanho e Estrutura
- Escreva métodos curtos, até 10 linhas.
```java
// Ruim
void processar() { /* 50 linhas de código */ }
// Bom
void processar() { validar(); calcular(); salvar(); }
```
- Escreva classes curtas com poucos métodos; é melhor ter 10 classes com 5 métodos cada do que 2 classes com 25 métodos cada.
```java
// Ruim
class UsuarioService { /* 30 métodos */ }
// Bom
class UsuarioService { /* 5 métodos */ }
class EmailService { /* 5 métodos */ }
```
- Crie métodos com poucos parâmetros de entrada.
```java
// Ruim
void cadastrar(String nome, String email, String senha, int idade, String endereco) { }
// Bom
void cadastrar(Usuario usuario) { }
```
- Cada método deve ter uma única responsabilidade.
```java
// Ruim
void salvarUsuarioEEnviarEmail(Usuario u) { /* salva e envia email */ }
// Bom
void salvarUsuario(Usuario u) { /* ... */ }
void enviarEmail(Usuario u) { /* ... */ }
```
- Extraia parte do código de um método e crie um novo método para ele.
```java
// Ruim
void processar() { /* validação + cálculo + salvar */ }
// Bom
void processar() { validar(); calcular(); salvar(); }
```

## 🧩 Organização e Encapsulamento
- Não permita código que não é utilizado: classes, métodos, propriedades de classes etc.
```java
// Ruim
private int nuncaUsado;
// Bom
// (remova variáveis não utilizadas)
```
- Não mantenha métodos públicos que devem ser usados apenas pela classe que é dona deles; exponha o mínimo possível de métodos públicos.
```java
// Ruim
public void metodoInterno() { }
// Bom
private void metodoInterno() { }
```
- Atenção ao criar propriedades de classe para guardar informações que deveriam ser parte de uma classe específica (primitive obsession).
```java
// Ruim
class Pedido { String status; }
// Bom
enum Status { NOVO, PAGO, ENVIADO }
class Pedido { Status status; }
```

## 🔄 Reutilização e Duplicidade
- Cuidado para não duplicar código, fazendo algo que já existe com outros nomes.
```java
// Ruim
void salvarCliente() { /* ... */ }
void salvarFornecedor() { /* mesmo código */ }
// Bom
void salvarPessoa(Pessoa p) { /* ... */ }
```

## 💬 Comentários
- Não use comentários para explicar código, apenas para explicar gambiarras ou algoritmos complexos.
```java
// Ruim
// Soma dois números
int soma = a + b;
// Bom
// Gambiarra temporária para contornar bug do sistema legado
// TODO: Remover após refatoração
```

## 🧹 Variáveis e Parâmetros
- Não usar variáveis temporárias para expressões muito simples e que são usadas apenas 1 vez no contexto.
```java
// Ruim
int resultado = a + b;
return resultado;
// Bom
return a + b;
```
- Não altere valores de parâmetros dentro de um método; quando precisar alterar, trabalhe sobre uma cópia desse valor.
```java
// Ruim
void processar(int valor) { valor++; }
// Bom
void processar(int valor) { int novoValor = valor + 1; }
```
- Use constantes simbólicas para representar números que têm um significado, como: constantes de cálculo, status etc.
```java
// Ruim
double salario = valor * 0.15;
// Bom
static final double TAXA_BONUS = 0.15;
double salario = valor * TAXA_BONUS;
```

## 🧠 Controle de Fluxo
- Evite IFs aninhados dentro de um método/iteração; prefira return, continue, break.
```java
// Ruim
if (a > 0) {
  if (b > 0) {
    // ...
  }
}
// Bom
if (a <= 0) return;
if (b <= 0) return;
// ...
```
- Quando tiver um condicional IF complexo, quebre em partes e extraia as condições para variáveis, ou mesmo extraia a condição total para um método separado.
```java
// Ruim
if (idade > 18 && salario > 2000 && tempoEmpresa > 2) { /* ... */ }
// Bom
boolean podeReceberBeneficio = idade > 18 && salario > 2000 && tempoEmpresa > 2;
if (podeReceberBeneficio) { /* ... */ }
```
- Prefira usar try/catch para lidar com casos de erros dentro de métodos do que retornar status de erro.
```java
// Ruim
if (!arquivoExiste) return false;
// Bom
try {
  lerArquivo();
} catch (IOException e) {
  // tratar erro
}
```

## 🏷️ Polimorfismo e Herança
- Não use o switch com código complexo em cada chave. Considere usar polimorfismo. Defina uma regra: não use switch para mais de 2 casos, ou se tiver regras de negócio processando dentro dos casos.
```java
// Ruim
switch(tipo) {
  case "CACHORRO": /* ... */ break;
  case "GATO": /* ... */ break;
}
// Bom
interface Animal { void emitirSom(); }
class Cachorro implements Animal { public void emitirSom() { System.out.println("Au au"); } }
class Gato implements Animal { public void emitirSom() { System.out.println("Miau"); } }
```
- Somente use herança quando for estritamente necessário. Cuidado com herança que não usa os métodos do pai (cachorro e cadeira têm 4 pernas, mas não significa que herdam da mesma classe);
```java
// Ruim
class Animal { }
class Cadeira extends Animal { }
// Bom
class Animal { }
class Cachorro extends Animal { }
// Cadeira não deve herdar de Animal
```




