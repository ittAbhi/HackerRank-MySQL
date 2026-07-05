# SQL INNER JOIN Notes

## What is an INNER JOIN?

An **INNER JOIN** combines two tables and returns **only the rows that have matching values in both tables**.

> 💡 **Shortcut:** `JOIN` = `INNER JOIN`

---

## When to Use INNER JOIN?

Use an **INNER JOIN** when the data you need is stored in **multiple tables**.

### Example

### `CITY` Table

| Name | Population | CountryCode |
|------|-----------:|-------------|
| Cairo | 10,000,000 | EGY |
| Delhi | 20,000,000 | IND |

### `COUNTRY` Table

| Code | Name | Continent |
|------|------|-----------|
| EGY | Egypt | Africa |
| IND | India | Asia |

Suppose the question asks:

> **Find the names of all cities in Africa.**

We need:

- **City Name** → `CITY`
- **Continent** → `COUNTRY`

Since the required data is stored in **two different tables**, we use an **INNER JOIN**.

---

## INNER JOIN Syntax

```sql
SELECT columns
FROM Table1
JOIN Table2
ON Table1.common_column = Table2.common_column;
```

### Explanation

| Keyword | Purpose |
|---------|---------|
| `FROM` | Starting table |
| `JOIN` | Connect another table |
| `ON` | Specifies how the two tables are related |
| `SELECT` | Chooses the columns to display |

---

## Query Without Aliases

```sql
SELECT CITY.Name
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';
```

### Step-by-Step Explanation

### 1. Display the City Name

```sql
SELECT CITY.Name
```

- Display the names of the cities.
- We write `CITY.Name` because **both tables contain a `Name` column**.

---

### 2. Starting Table

```sql
FROM CITY
```

- Begin with the `CITY` table.

---

### 3. Join Another Table

```sql
JOIN COUNTRY
```

- Connect the `COUNTRY` table.

---

### 4. Specify the Relationship

```sql
ON CITY.CountryCode = COUNTRY.Code
```

- Match each city with its country.
- `CountryCode` in `CITY` corresponds to `Code` in `COUNTRY`.

---

### 5. Filter the Result

```sql
WHERE COUNTRY.Continent = 'Africa'
```

- Keep only the cities whose country belongs to **Africa**.

---

## Why Write `CITY.Name`?

Suppose both tables contain a column named `Name`.

### `CITY`

| Name | CountryCode |
|------|-------------|
| Cairo | EGY |

### `COUNTRY`

| Code | Name | Continent |
|------|------|-----------|
| EGY | Egypt | Africa |

If you write:

```sql
SELECT Name;
```

SQL doesn't know which `Name` column you mean.

Instead, specify the table:

```sql
SELECT CITY.Name;
```

or

```sql
SELECT COUNTRY.Name;
```

This removes ambiguity.

---

## Using Table Aliases

Aliases are short names assigned to tables.

```sql
SELECT c.Name
FROM CITY AS c
JOIN COUNTRY AS co
ON c.CountryCode = co.Code
WHERE co.Continent = 'Africa';
```

### Alias Meaning

```sql
CITY AS c
```

means:

> Use **`c`** instead of writing **`CITY`**.

Similarly,

```sql
COUNTRY AS co
```

means:

> Use **`co`** instead of writing **`COUNTRY`**.

Now you can write:

```sql
c.Name
co.Continent
c.CountryCode
co.Code
```

instead of:

```sql
CITY.Name
COUNTRY.Continent
CITY.CountryCode
COUNTRY.Code
```

---

## `AS` is Optional

Both queries below are exactly the same.

### With `AS`

```sql
FROM CITY AS c
JOIN COUNTRY AS co
```

### Without `AS`

```sql
FROM CITY c
JOIN COUNTRY co
```

Most developers omit `AS` because it's shorter.

---

## Final Query (Recommended)

```sql
SELECT c.Name
FROM CITY c
JOIN COUNTRY co
ON c.CountryCode = co.Code
WHERE co.Continent = 'Africa';
```

---

## How to Read the Query

```text
FROM CITY
        │
        ▼
JOIN COUNTRY
        │
        ▼
Match using CountryCode = Code
        │
        ▼
Filter rows where Continent = 'Africa'
        │
        ▼
Display City Name
```

---

## Quick Revision

- ✅ `JOIN` = `INNER JOIN`
- ✅ Returns **only matching rows** from both tables.
- ✅ `ON` specifies how the tables are connected.
- ✅ Use **aliases** (`c`, `co`) to make queries shorter.
- ✅ If multiple tables have the same column name, always use the **table name or alias**.

---

## Problem-Solving Formula for JOIN Questions

Whenever you see a JOIN question, ask yourself these four questions:

1. **What information do I need?**
2. **Which table contains that information?**
3. **How are the tables connected?** (`ON`)
4. **Do I need filtering (`WHERE`) or aggregation (`SUM()`, `COUNT()`, `AVG()`, etc.)?**

> 💡 If you can answer these four questions, writing the SQL query becomes much easier.
