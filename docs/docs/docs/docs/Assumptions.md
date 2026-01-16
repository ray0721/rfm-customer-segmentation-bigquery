## Assumptions

- Each `customer_id` represents a unique customer.
- Transactions with negative quantity or zero/negative unit price were excluded as returns or invalid records.
- RFM metrics were calculated using the most recent transaction date in the dataset as the analysis reference date.
- Higher Frequency and Monetary values indicate stronger customer value.
- Lower Recency (fewer days since last purchase) indicates higher customer engagement.
- RFM scores were assigned using quintiles (`NTILE(5)`), assuming an even distribution approach is appropriate.
- Customer behavior is evaluated only within the available transaction history (no external data used).
