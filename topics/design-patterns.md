# Design patterns

Design patterns são soluções reutilizáveis para problemas comuns no desenvolvimento de software. São modelos e boas práticas para estruturar o código.

## Os mais comuns

- [Singleton 🏢](#singleton) \- Uma única instância global.
- [Builder 🏗️](#builder) \- Constrói objetos complexos passo a passo.
- [Strategy 🧠](#strategy) \- Algoritmos intercambiáveis em tempo de execução.
- [Factory method 🏭](#factory-method) \- Criação flexível de objetos.
- [Adapter/Facade 🔌🎭](#adapterfacade) \- Interfaces compatíveis ou simplificadas.
- [Proxy 🕵️‍♂️](#proxy) \- Controla acesso a outro objeto.
- [Observer 👀](#observer) \- Notificação automática de mudanças.
- [State 🔄](#state) \- Comportamento muda conforme estado interno.
- [Chain of Responsibility ⛓️](#chain-of-responsibility) \- Processamento em cadeia de handlers.
- [Composite 🌳](#composite) \- Estruturas de árvore parte-todo.
- [Decorator 🎁](#decorator) \- Adiciona funcionalidades dinamicamente.
- [Mediator 🤝](#mediator) \- Comunicação centralizada entre objetos.
- [Abstract Factory 🏭](#abstract-factory) \- Famílias de objetos relacionados.


### Singleton 🏢

O padrão de projeto Singleton garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global a ela. É utilizado para controlar o acesso a recursos compartilhados, como configurações ou logs, evitando múltiplas instâncias desnecessárias.

```java
public class ConfigurationManager {
    private static ConfigurationManager instance;
    private String config;

    private ConfigurationManager() {
        this.config = "App configuration loaded";
    }

    public static ConfigurationManager getInstance() {
        if (instance == null) {
            instance = new ConfigurationManager();
        }
        return instance;
    }

    public String getConfig() {
        return config;
    }
}
```

```java
// main.java
ConfigurationManager config1 = ConfigurationManager.getInstance();
ConfigurationManager config2 = ConfigurationManager.getInstance();

System.out.println(config1.getConfig());
System.out.println(config1 == config2);
```

### Builder 🏗️

O padrão de projeto Builder é utilizado para construir objetos complexos passo a passo. Ele separa a construção de um objeto da sua representação, permitindo que o mesmo processo de construção possa criar diferentes representações.

```java
public class User {
    private String name;
    private String email;

    private User(Builder builder) {
        this.name = builder.name;
        this.email = builder.email;
    }

    public static class Builder {
        private String name;
        private String email;

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setEmail(String email) {
            this.email = email;
            return this;
        }

        public User build() {
            return new User(this);
        }
    }

    public String getName() { return name; }
    public int getAge() { return age; }
    public String getEmail() { return email; }
}
```

```java
// main.java
User user = new User.Builder()
    .setName("Alice")
    .setEmail("alice@example.com")
    .build();

System.out.println(user.getName());
// print: Alice
```

### Strategy 🧠

O padrão de projeto Strategy define uma família de algoritmos, encapsula cada um deles e os torna intercambiáveis. Ele permite que o algoritmo varie independentemente dos clientes que o utilizam.

```java
// interface padrao
public interface PaymentStrategy {
    void pay(int amount);
}

public class CreditCardPayment implements PaymentStrategy {
    public void pay(int amount) {
        System.out.println("Paid " + amount + " using Credit Card.");
    }
}

public class PaypalPayment implements PaymentStrategy {
    public void pay(int amount) {
        System.out.println("Paid " + amount + " using PayPal.");
    }
}

public class ShoppingCart {
    private PaymentStrategy paymentStrategy;

    public void setPaymentStrategy(PaymentStrategy paymentStrategy) {
        this.paymentStrategy = paymentStrategy;
    }

    public void checkout(int amount) {
        paymentStrategy.pay(amount);
    }
}
```

```java
ShoppingCart cart = new ShoppingCart();
cart.setPaymentStrategy(new CreditCardPayment());
cart.checkout(100);

cart.setPaymentStrategy(new PaypalPayment());
cart.checkout(200);
```

### Factory method 🏭

O padrão de projeto Factory Method define uma interface para criar um objeto, mas permite que as subclasses decidam qual classe instanciar. Ele encapsula a criação de objetos em uma classe separada, promovendo a flexibilidade e a reutilização de código.

```java
// Product interface
interface Notification {
    send(message: string): void;
}

// Concrete products
class EmailNotification implements Notification {
    send(message: string): void {
        console.log(`Sending EMAIL: ${message}`);
    }
}

class SMSNotification implements Notification {
    send(message: string): void {
        console.log(`Sending SMS: ${message}`);
    }
}

// Factory
class NotificationFactory {
    static createNotification(type: string): Notification {
        switch (type) {
            case 'email':
                return new EmailNotification();
            case 'sms':
                return new SMSNotification();
            default:
                throw new Error('Unknown notification type');
        }
    }
}

// Usage
const notification = NotificationFactory.createNotification('email');
notification.send('Your order has been shipped!');
```

### Adapter/Facade 🔌🎭

O padrão de projeto Adapter permite que classes com interfaces incompatíveis trabalhem juntas.
Ele converte a interface de uma classe em outra interface que o cliente espera, permitindo que classes trabalhem juntas que não poderiam por causa de interfaces incompatíveis.
Simplifica o acesso a um conjunto de funcionalidades complexas, expondo uma interface única e simples.

```java
// InventoryService.java
public class InventoryService {
    public boolean checkStock(String productId) {
        System.out.println("Checking stock for product: " + productId);
        return true;
    }
}

// PaymentService.java
public class PaymentService {
    public boolean processPayment(String userId, double amount) {
        System.out.println("Processing payment for user: " + userId + ", amount: " + amount);
        return true;
    }
}

// ShippingService.java
public class ShippingService {
    public void shipProduct(String productId, String address) {
        System.out.println("Shipping product " + productId + " to address: " + address);
    }
}

// EcommerceFacade.java
public class EcommerceFacade {
    private final InventoryService inventory = new InventoryService();
    private final PaymentService payment = new PaymentService();
    private final ShippingService shipping = new ShippingService();

    public void placeOrder(String userId, String productId, double amount, String address) {
        if (inventory.checkStock(productId)) {
            if (payment.processPayment(userId, amount)) {
                shipping.shipProduct(productId, address);
                System.out.println("Order placed successfully!");
            }
        }
    }
}
```

### Proxy 🕵️‍♂️

O padrão de projeto Proxy fornece um substituto ou representante de outro objeto para controlar o acesso a ele.
Ele pode ser usado para adicionar funcionalidades como controle de acesso, cache ou lazy loading.

```java
// PagamentoService.java
public interface PagamentoService {
    boolean pagar(double valor);
}

// PagamentoServiceImpl.java
public class PagamentoServiceImpl implements PagamentoService {
    @Override
    public boolean pagar(double valor) {
        System.out.println("Processando pagamento de R$ " + valor + "...");
        // Here would be integration with the real gateway
        return true;
    }
}

// PagamentoServiceProxy.java
public class PagamentoServiceProxy implements PagamentoService {
    private final PagamentoService realService;

    public PagamentoServiceProxy(PagamentoService realService) {
        this.realService = realService;
    }

    @Override
    public boolean pagar(double valor) {
        System.out.println("LOG: Pedido de pagamento recebido para R$ " + valor);
        // You can add validation, cache, security, etc. here
        return realService.pagar(valor);
    }
}
```

```java
// Main.java
public class Main {
    public static void main(String[] args) {
        PagamentoService pagamentoReal = new PagamentoServiceImpl();
        PagamentoService proxy = new PagamentoServiceProxy(pagamentoReal);

        proxy.pagar(150.0); // Will log and process the payment
    }
}
```

### Observer 👀

O padrão de projeto Observer define uma dependência de um-para-muitos entre objetos, de modo que quando um objeto muda de estado, todos os seus dependentes são notificados e atualizados automaticamente.
É útil para implementar sistemas de eventos ou notificações.
Num cenário de mundo real, podemos substituir essa logica por controle de filas.

```java
// Observer
public interface PedidoObserver {
    void notificar(String pedidoId);
}

// Observers concretos
public class EmailObserver implements PedidoObserver {
    @Override
    public void notificar(String pedidoId) {
        System.out.println("Enviando email para pedido " + pedidoId);
    }
}

public class EstoqueObserver implements PedidoObserver {
    @Override
    public void notificar(String pedidoId) {
        System.out.println("Atualizando estoque para pedido " + pedidoId);
    }
}

public class AnalyticsObserver implements PedidoObserver {
    @Override
    public void notificar(String pedidoId) {
        System.out.println("Registrando pedido " + pedidoId + " no Analytics");
    }
}

// Subject
import java.util.ArrayList;
import java.util.List;

public class PedidoService {
    private List<PedidoObserver> observers = new ArrayList<>();

    public void adicionarObserver(PedidoObserver observer) {
        observers.add(observer);
    }

    public void criarPedido(String pedidoId) {
        System.out.println("Pedido " + pedidoId + " criado");
        for (PedidoObserver obs : observers) {
            obs.notificar(pedidoId);
        }
    }
}

// Main para testar
public class Main {
    public static void main(String[] args) {
        PedidoService pedidoService = new PedidoService();
        pedidoService.adicionarObserver(new EmailObserver());
        pedidoService.adicionarObserver(new EstoqueObserver());
        pedidoService.adicionarObserver(new AnalyticsObserver());

        pedidoService.criarPedido("12345");
    }
}
```

### State 🔄

O padrão de projeto State permite que um objeto altere seu comportamento quando seu estado interno muda.

```java
public interface PedidoState {
    void avancar(Pedido pedido);
    String getNome();
}

public class CriadoState implements PedidoState {
    public void avancar(Pedido pedido) {
        pedido.setState(new PagoState());
        System.out.println("Pedido agora está: Pago");
    }
    public String getNome() { return "Criado"; }
}

public class PagoState implements PedidoState {
    public void avancar(Pedido pedido) {
        pedido.setState(new EnviadoState());
        System.out.println("Pedido agora está: Enviado");
    }
    public String getNome() { return "Pago"; }
}

public class EnviadoState implements PedidoState {
    public void avancar(Pedido pedido) {
        System.out.println("Pedido já foi enviado. Não pode avançar mais.");
    }
    public String getNome() { return "Enviado"; }
}

public class Pedido {
    private PedidoState state;

    public Pedido() {
        this.state = new CriadoState();
    }

    public void setState(PedidoState state) {
        this.state = state;
    }

    public void avancar() {
        state.avancar(this);
    }

    public String getEstadoAtual() {
        return state.getNome();
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        Pedido pedido = new Pedido();
        System.out.println("Estado inicial: " + pedido.getEstadoAtual());

        pedido.avancar(); // paga
        System.out.println("Estado atual: " + pedido.getEstadoAtual());

        pedido.avancar(); // envia
        System.out.println("Estado atual: " + pedido.getEstadoAtual());

        pedido.avancar(); // não avança mais
        System.out.println("Estado atual: " + pedido.getEstadoAtual());
    }
}
```

### Chain of Responsibility ⛓️

O padrão de projeto Chain of Responsibility permite que um pedido seja passado por uma cadeia de manipuladores, onde cada um pode processar o pedido ou passá-lo adiante.

```javascript
// app.js
const express = require('express');
const app = express();

// Chain of Responsibility handlers
function corsHandler(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,POST');
  next(); // Pass to next handler
}

function authHandler(req, res, next) {
  if (!req.headers['authorization']) {
    return res.status(401).json({ error: 'Unauthorized' });
  }
  next();
}

function finalHandler(req, res) {
  res.json({ message: 'Request passed all handlers!' });
}

// Use handlers in chain order
app.use(corsHandler);
app.use(authHandler);
app.get('/api/data', finalHandler);

app.listen(3000, () => {
  console.log('Server running on port 3000');
});
```

### Composite 🌳

O padrão de projeto Composite permite que objetos sejam compostos em estruturas de árvore para representar hierarquias parte-todo. Ele permite que clientes tratem objetos individuais e composições de objetos de maneira uniforme.

```java
public interface ItemPedido {
    double getPreco();
    String getDescricao();
}

public class Produto implements ItemPedido {
    private String descricao;
    private double preco;

    public Produto(String descricao, double preco) {
        this.descricao = descricao;
        this.preco = preco;
    }

    public double getPreco() {
        return preco;
    }

    public String getDescricao() {
        return descricao;
    }
}

import java.util.ArrayList;
import java.util.List;

public class Pacote implements ItemPedido {
    private String descricao;
    private List<ItemPedido> itens = new ArrayList<>();

    public Pacote(String descricao) {
        this.descricao = descricao;
    }

    public void adicionar(ItemPedido item) {
        itens.add(item);
    }

    public double getPreco() {
        return itens.stream().mapToDouble(ItemPedido::getPreco).sum();
    }

    public String getDescricao() {
        return descricao + " (com " + itens.size() + " itens)";
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        Produto livro = new Produto("Livro Kotlin", 50.0);
        Produto fone = new Produto("Fone Bluetooth", 120.0);

        Pacote pacote = new Pacote("Pacote Promocional");
        pacote.adicionar(livro);
        pacote.adicionar(fone);

        System.out.println(livro.getDescricao() + " - R$ " + livro.getPreco());
        System.out.println(fone.getDescricao() + " - R$ " + fone.getPreco());
        System.out.println(pacote.getDescricao() + " - R$ " + pacote.getPreco());

        // Livro Kotlin - R$ 50.0
        // Fone Bluetooth - R$ 120.0
        // Pacote Promocional (com 2 itens) - R$ 170.0
    }
}
```

### Decorator 🎁

O padrão de projeto Decorator permite adicionar funcionalidades a um objeto dinamicamente, sem alterar sua estrutura.
Ele é usado para estender o comportamento de objetos de forma flexível e reutilizável.
É uma ideia de wrapper. Altera a response de um objeto sem alterar a classe original.

```java
public interface PedidoService {
    double calcularTotal(double valor);
}

public class PedidoServiceImpl implements PedidoService {
    @Override
    public double calcularTotal(double valor) {
        return valor;
    }
}

public class LogDecorator implements PedidoService {
    private PedidoService wrappee;

    public LogDecorator(PedidoService wrappee) {
        this.wrappee = wrappee;
    }

    @Override
    public double calcularTotal(double valor) {
        System.out.println("Pedido recebido. Valor: " + valor);
        return wrappee.calcularTotal(valor);
    }
}

public class DescontoDecorator implements PedidoService {
    private PedidoService wrappee;

    public DescontoDecorator(PedidoService wrappee) {
        this.wrappee = wrappee;
    }

    @Override
    public double calcularTotal(double valor) {
        double valorComDesconto = valor * 0.9; // 10% de desconto
        System.out.println("Aplicando desconto de 10%. Valor com desconto: " + valorComDesconto);
        return wrappee.calcularTotal(valorComDesconto);
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        PedidoService pedido = new PedidoServiceImpl();

        // Encadeando decorators
        PedidoService pedidoComLog = new LogDecorator(pedido);
        PedidoService pedidoComLogEDesconto = new DescontoDecorator(pedidoComLog);

        double total = pedidoComLogEDesconto.calcularTotal(100.0);
        System.out.println("Total final: " + total);
    }
}
```

### Mediator 🤝

O padrão de projeto Mediator define um objeto que encapsula como um conjunto de objetos interage. Ele promove o desacoplamento, evitando que os objetos se comuniquem diretamente, facilitando a manutenção e a extensibilidade do sistema.

```java
// Interface para os participantes
public interface Servico {
    void executar(String pedidoId);
}

// Mediator
public interface PedidoMediator {
    void processarPedido(String pedidoId);
}

// Implementação do Mediator
public class PedidoMediatorImpl implements PedidoMediator {
    private Servico pagamento;
    private Servico estoque;
    private Servico notificador;

    public PedidoMediatorImpl(Servico pagamento, Servico estoque, Servico notificador) {
        this.pagamento = pagamento;
        this.estoque = estoque;
        this.notificador = notificador;
    }

    @Override
    public void processarPedido(String pedidoId) {
        pagamento.executar(pedidoId);
        estoque.executar(pedidoId);
        notificador.executar(pedidoId);
    }
}

// Serviços concretos
public class PagamentoServico implements Servico {
    public void executar(String pedidoId) {
        System.out.println("Processando pagamento do pedido " + pedidoId);
    }
}

public class EstoqueServico implements Servico {
    public void executar(String pedidoId) {
        System.out.println("Atualizando estoque do pedido " + pedidoId);
    }
}

public class NotificadorServico implements Servico {
    public void executar(String pedidoId) {
        System.out.println("Enviando notificação do pedido " + pedidoId);
    }
}
```

```java
// Main para testar
public class Main {
    public static void main(String[] args) {
        Servico pagamento = new PagamentoServico();
        Servico estoque = new EstoqueServico();
        Servico notificador = new NotificadorServico();

        PedidoMediator mediator = new PedidoMediatorImpl(pagamento, estoque, notificador);

        mediator.processarPedido("12345");
    }
}
```

### Abstract Factory 🏭

O padrão Abstract Factory fornece uma interface para criar famílias de objetos relacionados ou dependentes sem especificar suas classes concretas. É útil quando você precisa garantir que produtos de uma família sejam usados juntos.

```java
// Produtos abstratos
interface NotificationSender {
    void send(String message);
}

interface Logger {
    void log(String message);
}

// Família de produtos para Email
class EmailSender implements NotificationSender {
    public void send(String message) {
        System.out.println("Email enviado: " + message);
    }
}

class EmailLogger implements Logger {
    public void log(String message) {
        System.out.println("Log por email: " + message);
    }
}

// Família de produtos para SMS
class SMSSender implements NotificationSender {
    public void send(String message) {
        System.out.println("SMS enviado: " + message);
    }
}

class SMSLogger implements Logger {
    public void log(String message) {
        System.out.println("Log por SMS: " + message);
    }
}

// Abstract Factory
interface CommunicationFactory {
    NotificationSender createSender();
    Logger createLogger();
}

// Factories concretas
class EmailFactory implements CommunicationFactory {
    public NotificationSender createSender() { return new EmailSender(); }
    public Logger createLogger() { return new EmailLogger(); }
}

class SMSFactory implements CommunicationFactory {
    public NotificationSender createSender() { return new SMSSender(); }
    public Logger createLogger() { return new SMSLogger(); }
}
```

```java
// Cliente que usa a factory
public class NotificationService {
    private NotificationSender sender;
    private Logger logger;
    
    public NotificationService(CommunicationFactory factory) {
        this.sender = factory.createSender();
        this.logger = factory.createLogger();
    }
    
    public void processNotification(String message) {
        logger.log("Processando: " + message);
        sender.send(message);
    }
}

// Main para testar
public class Main {
    public static void main(String[] args) {
        // Usando família Email
        CommunicationFactory emailFactory = new EmailFactory();
        NotificationService emailService = new NotificationService(emailFactory);
        emailService.processNotification("Pedido confirmado!");
        
        // Usando família SMS
        CommunicationFactory smsFactory = new SMSFactory();
        NotificationService smsService = new NotificationService(smsFactory);
        smsService.processNotification("Código de verificação");
    }
}
```
