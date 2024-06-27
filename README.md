# Sistema de Gestão de Biblioteca

Este projeto é um Sistema de Gestão de Biblioteca criado em MySQL. Ele permite gerenciar livros, membros, empréstimos e devoluções.

## Estrutura das Tabelas

- `Livros`: Armazena informações sobre os livros.
- `Membros`: Armazena informações sobre os membros.
- `Emprestimos`: Armazena informações sobre os empréstimos de livros.

## Funcionalidades

1. Registro de novos livros.
2. Registro de novos membros.
3. Empréstimo de livros.
4. Devolução de livros.
5. Consulta de disponibilidade de livros.

## Como Configurar

1. Clone o repositório.
2. Importe o arquivo `Projeto Biblioteca.sql` no seu banco de dados MySQL.
3. Use as consultas fornecidas para interagir com o sistema.

## Exemplo de Uso

### Registro de Novos Livros

```sql
INSERT INTO Livros (Titulo, Autor, Categoria, AnoPublicacao, Quantidade)
VALUES ('Dom Quixote', 'Miguel de Cervantes', 'Romance', 1605, 5);
