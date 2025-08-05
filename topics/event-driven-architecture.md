# Event Driven Architecture (EDA) 🚦

## O que é? 🤔

Arquitetura baseada em eventos, onde sistemas reagem a eventos emitidos por outros componentes, promovendo desacoplamento, escalabilidade e flexibilidade.

---

## Cenários de uso 🛠️

- **Queue** 📥  
  Processamento assíncrono de tarefas, integração entre sistemas, desacoplamento de produtores e consumidores.

- **Broadcasting** 📡  
  Notificação de múltiplos sistemas sobre uma mudança de estado, atualização em tempo real, sincronização de dados.

---

## Preocupações ⚠️

- **Como garantir uma transação que envolve mais de um serviço?** 🔄  
  Utilizar padrões como SAGA, Event Sourcing ou garantir idempotência e consistência eventual.

- **Como garantir o broker escalável?** 📈  
  Escolher brokers distribuídos, particionamento de tópicos/filas, monitoramento e ajuste de recursos conforme demanda.

---

## Distribuição das mensagens 📨

- **Aplicação orquestrando** 🎼  
  Um serviço central coordena o fluxo dos eventos, controlando a ordem e as ações de cada participante.

- **Aplicação coreografando** 💃  
  Cada serviço reage a eventos de forma independente, sem um coordenador central, promovendo autonomia.

---

## Quando usar cada serviço? 🧰

- **Kafka** 🦄  
  Grandes volumes de dados, alta performance, persistência e processamento em tempo real.

- **RabbitMQ** 🐰  
  Filas tradicionais, roteamento flexível, integração entre sistemas, workloads moderados.

- **Redis** 🚀  
  Mensageria leve, baixa latência, pub/sub simples, casos de cache e notificações rápidas.

- **AWS SQS/SNS** ☁️  
  Soluções gerenciadas, integração com serviços AWS, escalabilidade automática, simplicidade operacional.

- **GCS Pub/Sub** 🌐  
  Mensageria escalável e gerenciada no Google Cloud, integração com serviços GCP, processamento distribuído.
