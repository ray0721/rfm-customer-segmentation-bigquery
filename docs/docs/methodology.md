# Methodology

## Cleaning rules
- Removed rows with missing `customer_id`
- Filtered invalid pricing (price <= 0)
- Flagged:
  - `is_cancelled` (invoice starts with 'C')
  - `is_return` (quantity < 0)

## RFM definitions
- **Recency**: days since the customer’s most recent purchase (lower is better)
- **Frequency**: number of distinct invoices
- **Monetary**: total spend across all purchases

## Scoring
Used `NTILE(5)` to score each metric into 1–5.  
Recency scores are inverted so that lower recency days receive higher scores.
