# Controle de Colaboradores - SQL

Este projeto foi desenvolvido como parte de um exercício prático durante a faculdade. Ele consiste em um banco de dados simples para a gestão de colaboradores, com tabelas para departamentos, cidades, cargos e funcionários, além de consultas SQL para análise de dados relacionados.

## Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas:

1. **Departamento**
   - `codigo`: Código do departamento (PK).
   - `nome`: Nome do departamento.

2. **Cidade**
   - `codigo`: Código da cidade (PK).
   - `nome`: Nome da cidade.

3. **Cargo**
   - `codigo`: Código do cargo (PK).
   - `nome`: Nome do cargo.
   - `salario_base`: Salário base do cargo.

4. **Funcionario**
   - `codigo`: Código do funcionário (PK).
   - `nome`: Nome do funcionário.
   - `telefone`: Telefone do funcionário.
   - `cod_depto`: Código do departamento (FK).
   - `salario`: Salário do funcionário.
   - `cod_cidade`: Código da cidade (FK).
   - `cod_cargo`: Código do cargo (FK).

## Consultas SQL

O arquivo `Controle_de_Colaboradores.sql` contém as seguintes consultas:

1. **Inserção de dados:** Inserção de dados nas tabelas `Departamento`, `Cidade`, `Cargo` e `Funcionario`.
2. **Atualização de salários:** Aumento de 10% no salário de todos os funcionários.
3. **Seleção de funcionários com salário acima de 1000.**
4. **Contagem de funcionários com salário abaixo de 500.**
5. **Cálculo da média salarial.**
6. **Cálculo da média salarial para funcionários com salário abaixo de 1000.**
7. **Salário máximo e mínimo.**
8. **Contagem total de funcionários.**
9. **Soma total dos salários.**
10. **Soma dos salários por departamento.**
11. **Ordenação de funcionários por nome (crescente e decrescente).**
12. **Funcionários com salário acima da média.**

## Como Usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/ViniciusARD/Controle-de-Colaboradores-SQL.git
   ```

2. Execute o script SQL em um SGBD de sua preferência (ex: MySQL, PostgreSQL).

3. Explore as consultas e adapte conforme necessário.

## Tecnologias Utilizadas

- SQL (Structured Query Language)
- PostgreSQL
