-- verifiquei que não tem chaves primárias criadas
PRAGMA table_info(products);
PRAGMA table_info(sales);

-- colocar as keys criando novas tabelas para produtos e vendas
CREATE TABLE products_new (
    product_id INTEGER PRIMARY KEY,
    product_category TEXT,
    price REAL,
    review_count INTEGER
);

CREATE TABLE sales_new (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT,
    product_id INTEGER,
    quantity_sold INTEGER,
    customer_region TEXT,
    payment_method TEXT,
    discount_percent INTEGER,
    rating REAL,
    discounted_price REAL,
    total_revenue REAL,
    FOREIGN KEY (product_id) REFERENCES products_new(product_id)
);

-- copia os dados de uma tabela para a outra
INSERT INTO products_new (product_id, product_category, price, review_count)
SELECT product_id, product_category, price, review_count
FROM products;

INSERT INTO sales_new (
    order_id, order_date, product_id, quantity_sold,
    customer_region, payment_method, discount_percent,
    rating, discounted_price, total_revenue
)
SELECT
    order_id, order_date, product_id, quantity_sold,
    customer_region, payment_method, discount_percent,
    rating, discounted_price, total_revenue
FROM sales;

-- deleta as tabelas antigas
DROP TABLE sales;
DROP TABLE products;

-- ajusta o nome das novas
ALTER TABLE products_new RENAME TO products;
ALTER TABLE sales_new RENAME TO sales;

-- verifiquei que agora tem chaves primárias criadas
PRAGMA table_info(products);
PRAGMA table_info(sales);

-- e que a chave estrangeira está corretamente identificada
PRAGMA foreign_keys = ON;
PRAGMA foreign_key_list(sales);
