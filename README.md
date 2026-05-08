# 🔧 OficinaMecanica — Banco de Dados

Banco de dados relacional para gerenciamento de uma oficina mecânica, contendo clientes, veículos, mecânicos, ordens de serviço e serviços prestados.

---

## 📁 Estrutura do Banco

### Tabelas

#### `clientes`
Armazena os dados dos clientes da oficina.

| Coluna      | Tipo         | Descrição              |
|-------------|--------------|------------------------|
| id_cliente  | INT (PK)     | Identificador único    |
| nome        | VARCHAR(50)  | Nome do cliente        |
| cidade      | VARCHAR(50)  | Cidade do cliente      |

---

#### `veiculos`
Veículos vinculados aos clientes.

| Coluna     | Tipo         | Descrição                        |
|------------|--------------|----------------------------------|
| id_veiculo | INT (PK)     | Identificador único              |
| modelo     | VARCHAR(50)  | Modelo do veículo                |
| ano        | VARCHAR(4)   | Ano de fabricação                |
| id_cliente | INT (FK)     | Referência à tabela `clientes`   |

---

#### `mecanicos`
Mecânicos que atuam na oficina.

| Coluna        | Tipo          | Descrição                    |
|---------------|---------------|------------------------------|
| id_mecanico   | INT (PK, AI)  | Identificador único          |
| nome          | VARCHAR(100)  | Nome do mecânico             |
| especialidade | VARCHAR(200)  | Área de especialização       |

---

#### `servicos`
Catálogo de serviços disponíveis na oficina.

| Coluna      | Tipo          | Descrição               |
|-------------|---------------|-------------------------|
| id_servico  | INT (PK)      | Identificador único     |
| descrição   | VARCHAR(100)  | Nome/descrição do serviço |
| preco_base  | FLOAT         | Preço base do serviço   |

---

#### `ordem_servico`
Ordens de serviço abertas ou finalizadas.

| Coluna       | Tipo          | Descrição                          |
|--------------|---------------|------------------------------------|
| id_os        | INT (PK)      | Identificador único                |
| data_emissão | DATE          | Data de abertura da OS             |
| valor_total  | FLOAT         | Valor total cobrado                |
| stats        | VARCHAR(100)  | Status: `Aberto` ou `Finalizado`   |
| id_veiculo   | INT (FK)      | Referência à tabela `veiculos`     |
| id_mecanico  | INT (FK)      | Referência à tabela `mecanicos`    |

---

#### `itens_servicos`
Tabela associativa que relaciona ordens de serviço com os serviços executados.

| Coluna     | Tipo    | Descrição                             |
|------------|---------|---------------------------------------|
| id_os      | INT (FK, PK) | Referência à `ordem_servico`    |
| id_servico | INT (FK, PK) | Referência à `servicos`         |
| quantidade | INT     | Quantidade do serviço na OS           |

---

## 🔗 Diagrama de Relacionamentos

```
clientes (1) ──── (N) veiculos (1) ──── (N) ordem_servico (N) ──── (N) servicos
                                               │
                                         mecanicos (1)
```

- Um **cliente** pode ter vários **veículos**
- Um **veículo** pode ter várias **ordens de serviço**
- Uma **OS** é atribuída a um **mecânico**
- Uma **OS** pode conter vários **serviços** (via `itens_servicos`)

---

## 📊 Volume de Dados (seed)

| Tabela          | Registros |
|-----------------|-----------|
| clientes        | 50        |
| veiculos        | 50        |
| mecanicos       | 50        |
| servicos        | 50        |
| ordem_servico   | 50        |
| itens_servicos  | 51        |

---

## 🔍 Queries de Exemplo

### 1. Clientes e seus veículos
```sql
SELECT 
    c.nome AS Nome_Cliente, 
    v.modelo AS Modelo_Veiculo
FROM clientes c
LEFT JOIN veiculos v ON c.id_cliente = v.id_cliente;
```

### 2. Mecânicos com mais ordens de serviço
```sql
SELECT 
    m.nome AS Mecanico, 
    COUNT(os.id_os) AS Total_OS
FROM mecanicos m
LEFT JOIN ordem_servico os ON m.id_mecanico = os.id_mecanico
GROUP BY m.nome
ORDER BY Total_OS DESC;
```

### 3. Faturamento total de clientes de São Paulo
```sql
SELECT 
    SUM(os.valor_total) AS Faturamento_Total_SP
FROM ordem_servico os
JOIN veiculos v ON os.id_veiculo = v.id_veiculo
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE c.cidade = 'São Paulo';
```

### 4. Clientes que gastaram acima da média
```sql
SELECT 
    c.nome, 
    SUM(os.valor_total) AS Total_Gasto
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente, c.nome
HAVING SUM(os.valor_total) > (
    SELECT AVG(valor_total) FROM ordem_servico
)
ORDER BY Total_Gasto DESC;
```

```sql
-- 1. Criar e selecionar o banco
CREATE DATABASE OficinaMecanica;
USE OficinaMecanica;

-- 2. Executar o script de criação das tabelas (na ordem correta)
-- 3. Executar os INSERTs de dados
-- 4. Rodar as queries de consulta
```



