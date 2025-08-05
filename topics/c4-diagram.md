# Diagrama c4

Pensando em níveis de abstração.

## C1 - Contexto

Mostra seu sistema como uma caixa preta, quem o utiliza e com quais outros sistemas ele conversa.

- mostra seu sistema como um container, que ao redor tem personas e sistemas externos;
- bom para comunição entre time de desenvolvimento e PO, Gerentes, Stakeholders;
- responde o que o sistema faz, quem usa e com quais sistemas ele interage;

## C2 - Containers

Detalha as "peças" implantáveis do seu sistema, como a API, o banco de dados e o frontend, e como elas se comunicam.

- mostra a conexão entre os containers da sua aplicação, que podem ser aplicativos mobile, frontends, backends, bancos de dados, mensageria etc;
- bom para o time tecnico detalhar entre si a comunicação entre seus recursos;
- responde sobre a arquitetura e as tecnologias usadas no projeto;

## C3 - Componentes

Foca em um único container para expor seus principais módulos internos, como os Services e Repositories de uma API.

- mostra os detalhes das principais responsabilidades dentro de um container;
- bom para discutir sobre como projetar novas features;
- responde sobre a responsabilidade de cada módulo daquela aplicação específica;

## C4 - Código

Representa os detalhes da implementação de um componente, que geralmente são melhor visualizados diretamente no próprio código-fonte.

- mostra um detalhe de implementação de algum container especifico;
- não use. faça um bom código. isto é suficiente;
- exceção: explicar um algoritmo complexo;
