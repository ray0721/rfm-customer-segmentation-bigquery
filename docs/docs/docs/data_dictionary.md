# Data Dictionary

## clean_transactions
- `invoice_no` (STRING): invoice identifier
- `stock_code` (STRING): product code
- `description` (STRING): product description
- `quantity` (INT64): quantity purchased
- `invoice_ts` (TIMESTAMP): invoice timestamp
- `unit_price` (NUMERIC): unit price
- `sales_amount` (NUMERIC): quantity * unit_price
- `customer_id` (STRING): customer identifier
- `country` (STRING): customer country
- `is_cancelled` (BOOL): invoice starts with 'C'
- `is_return` (BOOL): quantity < 0
