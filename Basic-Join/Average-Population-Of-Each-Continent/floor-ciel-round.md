# MySQL Rounding Functions

## 1. FLOOR()

Returns the **largest integer less than or equal to** the given number.

> **Shortcut:** Always rounds **down**.

### Syntax

```sql
FLOOR(number)
```

### Example

```sql
SELECT FLOOR(10.9);   -- 10
SELECT FLOOR(-3.2);   -- -4
```

### Where to Use

- Round values down.
- Display integer values without exceeding the original number.
- Common with `AVG()`, prices, populations, etc.

---

## 2. CEIL() / CEILING()

Returns the **smallest integer greater than or equal to** the given number.

> **Shortcut:** Always rounds **up**.

### Syntax

```sql
CEIL(number);
-- or
CEILING(number);
```

### Example

```sql
SELECT CEIL(10.1);    -- 11
SELECT CEIL(-3.8);    -- -3
```

### Where to Use

- Round values up.
- Calculate required pages, seats, boxes, batches, etc.
- Ensure enough resources are allocated.

---

## 3. ROUND()

Rounds a number to the **nearest integer** (or to a specified number of decimal places).

### Syntax

```sql
ROUND(number);

-- OR

ROUND(number, decimal_places);
```

### Example

```sql
SELECT ROUND(7.4);      -- 7
SELECT ROUND(7.5);      -- 8
SELECT ROUND(15.678, 2); -- 15.68
```

### Where to Use

- Display user-friendly numbers.
- Financial calculations.
- Percentages, averages, and reports.

---

# Quick Comparison

| Function | Result | Example | Output |
|----------|--------|---------|-------:|
| `FLOOR()` | Always rounds down | `FLOOR(7.9)` | `7` |
| `CEIL()` | Always rounds up | `CEIL(7.1)` | `8` |
| `ROUND()` | Rounds to nearest | `ROUND(7.4)` | `7` |
| `ROUND()` | Rounds to nearest | `ROUND(7.5)` | `8` |

---

## Memory Trick

- ⬇️ `FLOOR()` → **Down**
- ⬆️ `CEIL()` → **Up**
- 🎯 `ROUND()` → **Nearest**
