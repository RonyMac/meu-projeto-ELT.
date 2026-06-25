Markdown
# Pipeline de ELT Moderno: Da Ingestão Bruta ao Insight de Negócio

## 📌 Sobre o Projeto
Este projeto simula uma infraestrutura real de Analytics Engineering utilizando uma abordagem moderna de **ELT (Extract, Load, Transform)**. O objetivo principal é demonstrar maturidade arquitetural ao separar a ingestão de dados brutos da camada de transformação lógica e qualidade de dados, preparando uma base altamente inconsistente para o consumo de ferramentas inteligentes de BI.

---

## ⚠️ O Problema de Negócio
No cenário proposto, recebemos uma base de cadastros de clientes (formato CSV) contendo falhas críticas de integridade que inviabilizariam qualquer tomada de decisão ou conexão direta com ferramentas de BI:
* **Perda de Integridade Referencial:** Cerca de **11% da base** continha chaves primárias (`id`) nulas ou corrompidas.
* **Inconsistência Textual:** Nomes e sobrenomes desalinhados, alternando entre caixas altas e baixas, além de espaços em branco desnecessários.
* **Ausência de Placeholders:** Registros de e-mail e dados de gênero ausentes sem nenhum tratamento de padrão.

---

## 🛠️ Tecnologias Utilizadas
* **Linguagem Principal:** Python 3 (focado na automação da ingestão).
* **Ingestão (Extract & Load):** Pandas e SQLAlchemy (Engine de conexão).
* **Banco de Dados (Target):** SQLite (Engine local leve de armazenamento relacional).
* **Transformação (Transform):** **dbt (Data Build Tool)** e SQL ANSI (Modelagem de dados e Views).
* **Qualidade de Dados:** dbt Data Tests (Garantia de chaves únicas e não nulas).
* **Visualização (BI):** Power BI Desktop (Consumo das métricas).

---

## 🏗️ Arquitetura do Projeto: Por que ELT?
Em vez do modelo tradicional de ETL (onde o servidor de aplicação faz o processamento pesado antes da carga), este projeto adota o **ELT**:
1. **Extract & Load (Python):** O script lê o CSV bruto e faz o "dump" (despejo) imediato para uma tabela de staging dentro do banco SQL, sem gastar processamento de aplicação na memória.
2. **Transform (SQL + dbt):** A computação e a limpeza pesada são empurradas para dentro do próprio banco de dados utilizando Queries SQL nativas gerenciadas pelo dbt. Isso garante escalabilidade, governança de dados e rastreabilidade do pipeline.

```text
[CSV Bruto] ──(Python/SQLAlchemy)──> [SQLite: Tabela Bruta] ──(dbt/SQL)──> [SQLite: View Limpa] ──> [Power BI]


