## 🧠 Prompt para IA

Solicitando a IA para validar o codigo de acordo com regras de clean code.

*Agnostico de linguagem*

--

Analise o código fornecido e verifique se ele segue as seguintes boas práticas de clean code:

- Os nomes de variáveis, funções, métodos e classes são claros e expressam seu propósito?
- Os métodos/funções são curtos e têm uma única responsabilidade?
- As classes são pequenas, coesas e possuem poucos métodos?
- Métodos/funções têm poucos parâmetros de entrada?
- Não há código, variáveis ou métodos não utilizados?
- O encapsulamento é respeitado (exponha apenas o necessário)?
- Não há duplicidade de código (reutilize sempre que possível)?
- Comentários são usados apenas para explicar exceções ou algoritmos complexos, não para explicar código trivial?
- Variáveis temporárias são evitadas quando não agregam clareza?
- Parâmetros de métodos não são alterados diretamente; use cópias se necessário.
- Constantes simbólicas são usadas para valores com significado especial.
- O controle de fluxo evita ifs aninhados e é simplificado com retornos antecipados, variáveis intermediárias ou métodos auxiliares.
- O tratamento de erros é feito preferencialmente com exceções, não com códigos de status.
- Prefira polimorfismo a estruturas de decisão complexas (como switch/case ou ifs encadeados).
- Herança só é usada quando faz sentido conceitual; evite herança inadequada.
- Dê feedback objetivo sobre violações dessas regras e sugira melhorias, independentemente da linguagem utilizada.
