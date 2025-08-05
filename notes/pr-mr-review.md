## 🧠 Questionamentos sobre validação de Merge/Pull request

- Atende aos requisitos originais?
- É logicamente correto?
- Não apresenta complexidade desnecessária?
- É robusto (ou seja, sem problemas de simultaneidade, tratamento adequado de erros, etc.)?
- É seguro (ou seja, sem injeções de SQL, etc.)?
- É observável (ou seja, métricas, registro, rastreamento, etc.)?
- As dependências recém-adicionadas cumprem sua função? A licença é aceitável?
- Foram criados testes automatizados para a funcionalidade?
- Dá para executar rollback? tem plano B?