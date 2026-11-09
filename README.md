# prolog-exercises

## Exercícios e Projetos em Prolog

Este repositório armazena implementações em **Prolog** focadas em lógica de predicados, manipulação de conjuntos e processamento de linguagem natural (PLN) utilizando Gramáticas de Cláusulas Definitivas (DCGs).

---

## Estrutura do Repositório

* **`manipulacao_de_conjuntos`**: Implementação de operações sobre conjuntos do zero (conversão de listas em conjuntos, união, intersecção, diferença e verificação de igualdade), acompanhada de testes unitários[cite: 1].
* **definitive_clause_grammar`**: Analisador sintático baseado em DCGs para concordância de gênero, número e regência verbal, gerando árvores de derivação estruturadas[cite: 2].

---

## Tecnologias e Ferramentas

* **Linguagem:** Prolog (compatível com SWI-Prolog)
* **Testes Automatizados:** Framework nativo **PlUnit** (`begin_tests`)

---

## Como Executar os Testes

1. Certifique-se de ter o [SWI-Prolog](https://www.swi-prolog.org/) instalado em seu computador.
2. Abra o terminal na pasta do projeto e inicie o interpretador:
   ```bash
   swipl
