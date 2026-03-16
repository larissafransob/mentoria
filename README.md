## Mentoria
Projeto desenvolvido com orientação de Artemísia Weyl @arteweyl

Passo a passo realizado
1. Descrição do Dataset
O dataset utilizado neste projeto contém aproximadamente 50.000 registros e 13 variáveis relacionadas a transações de e-commerce.
Cada registro representa um pedido de venda contendo informações sobre o produto, preço, descontos, região do cliente, método de pagamento, avaliações e receita total.
2. Análise Exploratória de Dados (EDA)
Foi realizada uma análise exploratória dos dados para compreender a estrutura e a qualidade do dataset.
Essa etapa incluiu a inspeção dos tipos de dados, verificação de valores ausentes e análise das distribuições das variáveis.
A análise confirmou que o dataset estava consistente e adequado para transformação e modelagem em banco de dados.
3. Separação do Dataset
O dataset foi dividido em dois conjuntos de dados lógicos com base nas características das variáveis:
Dataset de produtos
•	product_id
•	product_category
•	price
•	review_count
Dataset de vendas
•	order_id
•	order_date
•	product_id
•	quantity_sold
•	customer_region
•	payment_method
•	discount_percent
•	rating
•	discounted_price
•	total_revenue
Essa separação permitiu a criação de uma estrutura relacional normalizada.
4. Implementação do Banco de Dados Relacional
Foi implementado um banco de dados relacional utilizando SQLite.
Foram criadas duas tabelas:
products
•	product_id (Chave Primária)
•	product_category
•	price
•	review_count
sales
•	order_id (Chave Primária)
•	product_id (Chave Estrangeira referenciando products.product_id)
•	order_date
•	quantity_sold
•	customer_region
•	payment_method
•	discount_percent
•	rating
•	discounted_price
•	total_revenue
O relacionamento entre as tabelas foi estabelecido através do campo product_id, permitindo consultas relacionais utilizando SQL JOIN.
5. Processamento de Dados com Pandas e Spark
O dataset foi processado utilizando Pandas para manipulação e carga dos dados no banco relacional.
Além disso, Apache Spark foi utilizado para demonstrar processamento distribuído de dados e execução de consultas utilizando Spark SQL.
As tabelas foram criadas e consultadas com sucesso utilizando Spark.
6. Transformação para Estrutura Orientada a Documentos
Para preparar os dados para um banco orientado a documentos, como o MongoDB, as tabelas relacionais foram unidas e transformadas em documentos estruturados.
Cada documento representa uma transação de venda e contém informações incorporadas sobre o produto, detalhes da venda, região do cliente, método de pagamento e avaliação.
Exemplo da estrutura do documento:
{
  "order_id": 1,
  "product": {
    "product_id": 2637,
    "category": "Books",
    "price": 128.75
  },
  "sale": {
    "quantity_sold": 4,
    "discount_percent": 10,
    "total_revenue": 463.52
  },
  "customer": {
    "region": "North America"
  }
}
7. Exportação para JSON
Os documentos estruturados foram exportados para um arquivo JSON, que pode ser importado diretamente em bancos de dados orientados a documentos como o MongoDB.
