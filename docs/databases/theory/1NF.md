# First normal form (1NF)

First normal form (1NF) is a property of a relation in a relational database. A
relation is in first normal form if and only if the domain of each attribute
contains only atomic (indivisible) values, and the value of each attribute
contains only a single value from that domain.

First normal form enforces these criteria:

- Eliminate repeating groups in individual tables
- Create a separate table for each set of related data
- Identify each set of related data with a primary key

## Requirements

1. There's no top-to-bottom ordering to the rows.
2. There's no left-to-right ordering to the columns.
3. There are no duplicate rows.
4. Every row-and-column intersection contains exactly one value from the
   applicable domain (and nothing else).
5. All columns are regular (i.e. rows have no hidden components such as row IDs,
   object IDs, or hidden timestamps).

## Examples

### Non-complient

- Left to Right ordering

|Customer ID|First Name|Surname|Telephone Number|
|-|-|-|-|
|123|Pooja|Singh|555-861-2025, 192-122-1111|
|456|San|Zhang|(555) 403-1659 Ext. 53; 182-929-2929|
|789|John|Doe|555-808-9633|

- Two columns refering to the same thing

|Customer ID|First Name|Surname|Telephone Number1|Telephone Number2|
|-|-|-|-|-|
|123|Pooja|Singh|555-861-2025|192-122-1111|
|456|San|Zhang|(555) 403-1659 Ext. 53|182-929-2929|
|789|John|Doe|555-808-9633||

### Complient

|Customer ID|First Name|Surname|
|-|-|-|
|123|Pooja|Singh|
|456|San|Zhang|
|789|John|Doe|

|Id|Customer ID|Telephone Number|
|-|-|-|
|1|123|555-861-2025|
|2|123|192-122-1111|
|3|456|(555) 403-1659 Ext. 53|
|4|456|182-929-2929|
|5|789|555-808-9633|
