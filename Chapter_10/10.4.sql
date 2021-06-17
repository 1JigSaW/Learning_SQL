mysql> SELECT ones.x + tens.x + 1
    -> FROM
    -> (SELECT 0 x UNION ALL
    -> SELECT 1 x UNION ALL
    -> SELECT 2 x UNION ALL
    -> SELECT 3 x UNION ALL
    -> SELECT 4 x UNION ALL
    -> SELECT 5 x UNION ALL
    -> SELECT 6 x UNION ALL
    -> SELECT 7 x UNION ALL
    -> SELECT 8 x UNION ALL
    -> SELECT 9 x) ones
    -> CROSS JOIN
    -> (SELECT 0 x UNION ALL
    -> SELECT 10 x UNION ALL
    -> SELECT 20 x UNION ALL
    -> SELECT 30 x UNION ALL
    -> SELECT 40 x UNION ALL
    -> SELECT 50 x UNION ALL
    -> SELECT 60 x UNION ALL
    -> SELECT 70 x UNION ALL
    -> SELECT 80 x UNION ALL
    -> SELECT 90 x) tens;
+---------------------+
| ones.x + tens.x + 1 |
+---------------------+
|                  10 |
|                   9 |
|                   8 |
|                   7 |
|                   6 |
|                   5 |
|                   4 |
|                   3 |
|                   2 |
|                   1 |
|                  20 |
|                  19 |
|                  18 |
|                  17 |
|                  16 |
|                  15 |
|                  14 |
|                  13 |
|                  12 |
|                  11 |
|                  30 |
|                  29 |
|                  28 |
|                  27 |
|                  26 |
|                  25 |
|                  24 |
|                  23 |
|                  22 |
|                  21 |
|                  40 |
|                  39 |
|                  38 |
|                  37 |
|                  36 |
|                  35 |
|                  34 |
|                  33 |
|                  32 |
|                  31 |
|                  50 |
|                  49 |
|                  48 |
|                  47 |
|                  46 |
|                  45 |
|                  44 |
|                  43 |
|                  42 |
|                  41 |
|                  60 |
|                  59 |
|                  58 |
|                  57 |
|                  56 |
|                  55 |
|                  54 |
|                  53 |
|                  52 |
|                  51 |
|                  70 |
|                  69 |
|                  68 |
|                  67 |
|                  66 |
|                  65 |
|                  64 |
|                  63 |
|                  62 |
|                  61 |
|                  80 |
|                  79 |
|                  78 |
|                  77 |
|                  76 |
|                  75 |
|                  74 |
|                  73 |
|                  72 |
|                  71 |
|                  90 |
|                  89 |
|                  88 |
|                  87 |
|                  86 |
|                  85 |
|                  84 |
|                  83 |
|                  82 |
|                  81 |
|                 100 |
|                  99 |
|                  98 |
|                  97 |
|                  96 |
|                  95 |
|                  94 |
|                  93 |
|                  92 |
|                  91 |
+---------------------+
100 rows in set (0.00 sec)
