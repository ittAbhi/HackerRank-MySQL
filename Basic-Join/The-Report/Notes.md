# HackerRank - The Report

This problem teaches four important SQL concepts:

- **Joining tables without `=`**
- **Using `BETWEEN` in a JOIN**
- **Using `CASE`**
- **Conditional `ORDER BY`**

---

# Step 1: Understand the Tables

## Students

| ID | Name | Marks |
|----|------|------:|
| 1 | Maria | 99 |
| 2 | Jane | 81 |
| 3 | Julia | 88 |
| 4 | Scarlet | 78 |
| 5 | Ashley | 63 |

Notice that the **Students** table does **not** contain a `Grade` column.

---

## Grades

| Grade | Min_Mark | Max_Mark |
|------:|---------:|---------:|
| 10 | 90 | 100 |
| 9 | 80 | 89 |
| 8 | 70 | 79 |
| 7 | 60 | 69 |
| 6 | 50 | 59 |

This table defines the grading system.

```
90 - 100 → Grade 10
80 - 89  → Grade 9
70 - 79  → Grade 8
60 - 69  → Grade 7
```

---

# Step 2: How do we join these tables?

Normally we join tables using equal values.

Example:

```sql
ON Student.ID = Marks.StudentID
```

or

```sql
ON Country.Code = City.CountryCode
```

But here, there is **no common column**.

Instead, a student's marks determine their grade.

Example:

Maria has

```
Marks = 99
```

99 falls in the range

```
90 - 100
```

Therefore,

```
Grade = 10
```

Similarly,

Jane

```
Marks = 81
```

81 falls in

```
80 - 89
```

Therefore,

```
Grade = 9
```

Instead of matching one value to another, we match a value to a **range**.

So the JOIN becomes

```sql
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark
```

### Read it like English

> Join the row where the student's marks fall between the minimum and maximum marks.

---

## Visualization

```
Student Marks

99
 │
 ▼
90 -------------------100
        Grade 10

81
 │
 ▼
80 -------------------89
        Grade 9

63
 │
 ▼
60 -------------------69
        Grade 7
```

---

# Step 3: Display the Name

The question says:

- If Grade is **8, 9, or 10**, print the student's name.
- If Grade is **less than 8**, print **NULL** instead.

Example after joining:

| Name | Grade | Marks |
|------|------:|------:|
| Maria | 10 | 99 |
| Jane | 9 | 81 |
| Julia | 9 | 88 |
| Scarlet | 8 | 78 |
| Ashley | 7 | 63 |

Expected output:

| Name | Grade | Marks |
|------|------:|------:|
| Maria | 10 | 99 |
| Jane | 9 | 81 |
| Julia | 9 | 88 |
| Scarlet | 8 | 78 |
| NULL | 7 | 63 |

We use `CASE`:

```sql
CASE
    WHEN G.Grade >= 8 THEN S.Name
    ELSE NULL
END
```

### Read it like English

```
If Grade is at least 8

→ Show Name

Otherwise

→ Show NULL
```

---

# Step 4: Understanding ORDER BY

The question contains **three sorting rules**.

---

## Rule 1

Sort by Grade in descending order.

```
10
9
8
7
6
```

```sql
ORDER BY G.Grade DESC
```

---

## Rule 2

If Grade is **8 or higher**, sort alphabetically by Name.

Example

| Name | Grade |
|------|------:|
| Julia | 9 |
| Jane | 9 |

Correct order

```
Jane
Julia
```

---

## Rule 3

If Grade is **less than 8**, sort by Marks.

Example

| Name | Grade | Marks |
|------|------:|------:|
| NULL | 7 | 68 |
| NULL | 7 | 63 |

Correct order

```
63
68
```

---

# Why not simply write?

```sql
ORDER BY Grade DESC,
         Name ASC,
         Marks ASC;
```

Because students with Grade less than 8 have **NULL** names.

Sorting NULL values alphabetically doesn't make sense.

The question requires:

- Grade **8 or above** → Sort by Name
- Grade **below 8** → Sort by Marks

This is called **Conditional Sorting**.

---

# Conditional ORDER BY

We use `CASE` inside `ORDER BY`.

```sql
ORDER BY

G.Grade DESC,

CASE
    WHEN G.Grade >= 8 THEN S.Name
END ASC,

CASE
    WHEN G.Grade < 8 THEN S.Marks
END ASC;
```

### Read it like English

```
First,
sort by Grade.

If Grade is at least 8,
sort by Name.

Otherwise,
sort by Marks.
```

---

# Complete Query

```sql
SELECT
    CASE
        WHEN G.Grade >= 8 THEN S.Name
        ELSE NULL
    END AS Name,

    G.Grade,

    S.Marks

FROM Students AS S

JOIN Grades AS G
ON S.Marks BETWEEN G.Min_Mark AND G.Max_Mark

ORDER BY
    G.Grade DESC,

    CASE
        WHEN G.Grade >= 8 THEN S.Name
    END ASC,

    CASE
        WHEN G.Grade < 8 THEN S.Marks
    END ASC;
```

---

# Why don't we use GROUP BY?

Many beginners think `GROUP BY` should be used here, but it **isn't needed**.

### Ask yourself:

> **Am I combining multiple rows into one?**

- **Yes** → Use `GROUP BY`
- **No** → Don't use `GROUP BY`

This question wants **one row for every student**.

Example:

| Name | Grade | Marks |
|------|------:|------:|
| Maria | 10 | 99 |
| Jane | 9 | 81 |
| Julia | 9 | 88 |
| Scarlet | 8 | 78 |
| NULL | 7 | 63 |

No rows are combined.

So **GROUP BY is not required**.

---

## Compare with another question

### Average City Population by Continent

```
Delhi
Mumbai
Tokyo
Beijing
      │
      ▼
     Asia
```

Many rows become **one row**.

```
Asia → Average Population
```

✅ Use `GROUP BY Continent`

---

### Student Report

```
Maria
Jane
Julia
Scarlet
Ashley
```

Each student remains as an individual row.

❌ No `GROUP BY`

---

# Concepts Learned

- Joining tables using `BETWEEN`
- Range-based JOIN
- `CASE` statement
- Conditional `ORDER BY`
- Difference between `ORDER BY` and `GROUP BY`

---

# Interview Tip

Whenever you see words like:

- **If...**
- **Otherwise...**
- **For these rows...**
- **For the remaining rows...**
- **Print X for some rows and Y for others**
- **Sort some rows one way and the rest another way**

Your first thought should be:

> **Use `CASE`.**

Similarly, ask yourself:

> **"Am I summarizing data?"**

- **Yes** → `GROUP BY`
- **No** → No `GROUP BY`

This simple habit helps solve many SQL interview questions correctly.
