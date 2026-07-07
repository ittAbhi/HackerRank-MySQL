# FLOOR() in MySQL

The `FLOOR()` function returns the **largest integer less than or equal to** a given number.

> **Shortcut:** `FLOOR()` always **rounds down**.

---

# Syntax

```sql
FLOOR(number)
```

---

# Examples

### Example 1

```sql
SELECT FLOOR(10.9);
```

**Output**

```text
10
```

---

### Example 2

```sql
SELECT FLOOR(15.1);
```

**Output**

```text
15
```

---

### Example 3 (Negative Number)

```sql
SELECT FLOOR(-3.2);
```

**Output**

```text
-4
```

> `-4` is the largest integer that is **less than or equal to** `-3.2`.

---

# Example with a Table

### Employee Table

| Name | Salary |
|------|--------:|
| A | 25450.75 |
| B | 32789.99 |
| C | 41000.10 |

### Query

```sql
SELECT Name,
       FLOOR(Salary) AS RoundedSalary
FROM Employee;
```

### Output

| Name | RoundedSalary |
|------|--------------:|
| A | 25450 |
| B | 32789 |
| C | 41000 |

---

# Common Use Case

Find the average city population of each continent and round it down.

```sql
SELECT COUNTRY.Continent,
       FLOOR(AVG(CITY.Population)) AS AvgPopulation
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;
```

If the average population is:

```text
12345.89
```

Then:

```sql
FLOOR(AVG(Population))
```

returns:

```text
12345
```

---

# FLOOR() vs CEIL() vs ROUND()

| Function | Description | Example | Output |
|----------|-------------|---------|-------:|
| `FLOOR()` | Always rounds down | `FLOOR(7.9)` | `7` |
| `CEIL()` / `CEILING()` | Always rounds up | `CEIL(7.1)` | `8` |
| `ROUND()` | Rounds to the nearest integer | `ROUND(7.5)` | `8` |
| `ROUND()` | Rounds to the nearest integer | `ROUND(7.4)` | `7` |

---

# Quick Memory Trick

- ⬇️ `FLOOR()` → Always **rounds down**
- ⬆️ `CEIL()` / `CEILING()` → Always **rounds up**
- 🎯 `ROUND()` → Rounds to the **nearest integer**

---

# Key Points

- Returns the **largest integer less than or equal to** the given number.
- Removes the decimal part by **rounding down**.
- Works with both positive and negative numbers.
- Commonly used with aggregate functions like `AVG()` when the output must be an integer.
