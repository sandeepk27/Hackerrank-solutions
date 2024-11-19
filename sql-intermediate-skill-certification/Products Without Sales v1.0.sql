---- Products Without Sales v1.0

SELECT 
     product.sku, product.product_name
FROM 
     product
WHERE
     product.id NOT IN (SELECT product_id FROM invoice_item);