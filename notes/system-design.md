# System Design

System Design é o processo de definir arquitetura, componentes, interfaces e dados de um sistema. Ele vai além do código, focando em como as partes do sistema interagem, escalabilidade, performance, segurança, manutenção e entrega de valor ao negócio.

## Principais Elementos

### Arquitetura

- Monolito: Sistema único, fácil de começar, difícil de escalar em times grandes.
- Microserviços: Dividido em serviços pequenos e independentes, facilitando deploy, escalabilidade e isolamento de falhas.
- Serverless: Funções isoladas, escalabilidade automática, paga por uso.

### Componentes

- Backend: APIs, serviços, bancos de dados, filas, cache, autenticação.
- Frontend: Interfaces com usuário, apps web/mobile.
- Infraestrutura: Cloud, containers, pipelines CI/CD, monitoramento.

### Comunicação

- Síncrona: HTTP, REST, gRPC.
- Assíncrona: Filas, eventos, Kafka, RabbitMQ.

### Escalabilidade

- Horizontal: Mais máquinas/instâncias.
- Vertical: Mais recursos em uma máquina.

### Resiliência & Alta Disponibilidade

Replicação de dados, balanceamento de carga, fallback, retry, circuit breaker.

### Segurança

Autenticação, autorização, criptografia, proteção contra ataques.

### Observabilidade

Logs, métricas, tracing, alertas.

### Manutenção e Evolução

Modularidade, separação de responsabilidades, testes automatizados, documentação.
