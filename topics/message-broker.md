# Mensageria

## Conceitos e termos

Preocupações a resolver quando configurar um fluxo de mensageria.

- Producer (Publisher): A aplicação que envia/publica a mensagem.	Entender o ciclo de vida do envio, se a mensagem foi confirmada pelo broker, e se o broker estiver offline;
- Consumer (Subscriber): A aplicação que recebe/consome a mensagem. Garantir que a mensagem foi processada com sucesso, preparar para falhas no meio do processamento;
- Broker (ex: RabbitMQ, Kafka, SQS). Entender suas garantias de entrega, performance e limitações;
- Queue (Fila): Uma fila de mensagens. Padrão Point-to-Point (1 mensagem -> 1 consumidor). Ideal para distribuir tarefas simples e de escopo fechado entre workers;
- Topic (Tópico):	Um canal de publicação  (1 mensagem -> X consumidores). Padrão Pub(lish)/Sub(scribe).	Notificar diferentes partes do sistema sobre um evento comum;
- Message / Event	O dado que está sendo trafegado. O contrato!

## Como escalar?

- horizontal: mais consumidores na mesma fila;
- vertical: aumentar recursos do broker (quando for self-hosted);

## Como tratar erros nos processos?

- Retentativas automaticas configuradas;
- DLQ (Dead Letter Queue): Configurar a fila para armazenar processos com erro, pois das falhas nas retentativas;
- Observabilidade: Nack, DLQ ou latencia crescendo pode indicar problemas (adicionar monitorias);
- Processo de retentativa manual;
- Configurar publisher returns;
- Os processamentos precisam ser idempotentes (pode receber a mesma mensagem multiplas vezes sem causar quebrar no fluxo);

## Qual broker usar?

- RabbitMQ: Distribuição de tarefas, roteamento complexo de mensagens. Flexibilidade de roteamento (AMQP), fácil de começar. Considerar: Não retem mensagens por muito tempo;
- Apache Kafka: Alto throughput, altíssima performance, durabilidade (mensagens são retidas), replay de eventos. Considerar: Mais complexo de operar e configurar, a ordem das mensagens é garantida apenas por partição;
- AWS SQS/SNS, Google Pub/Sub: Quando você não quer/pode gerenciar a infraestrutura. Escalabilidade "infinita". Considerar: Pode ser mais caro em altíssimo volume, menos flexibilidade de configuração fina;
