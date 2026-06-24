-- stg_clientes.sql
WITH source AS (
    SELECT * FROM raw_clientes
)

SELECT
    CAST(id AS INT) AS cliente_id,
    UPPER(TRIM(COALESCE(first_name, '') || ' ' || COALESCE(last_name, ''))) AS nome_completo,
    LOWER(TRIM(COALESCE(email, 'nao_informado@email.com'))) AS email,
    UPPER(TRIM(COALESCE(gender, 'NÃO INFORMADO'))) AS genero,
    TRIM(COALESCE(ip_address, '0.0.0.0')) AS ip_address
FROM source
WHERE id IS NOT NULL -- Regra de negócio: remove IDs nulos
