# DB_Lab_7

## General task

1. Create a database with 3 normal forms. 
   To ensure the integrity of the values use 
   triggers instead of foreign keys. 
   Database name in the format: 
   student's last name, laboratory number, variant number,
   for example, **Pavelchak_9_23**.
2. Fill in each database table at least 10 records (if
   the number of course is not limited by logic).
3. Implement software designs from the task.

## My task (V-41):

### Database
    
Database of pharmacy institutions in Novosilky

### Stored procedures

1. Implement parameterized insertion of
   new values into **Employees** table.
2. Create a package of 10 rows in 
   the **Street** in table with
   format `Noname№`, such as 
   `Noname5`, where the number
   generated randomly. 
   It is necessary to check that
   the numbers did not match the existing ones.
3. Using the cursor, provide dynamic created
   table containing columns with `names` from
   the **Pharmacy** table institution. 
   The type of columns is arbitrary.
   
### Functions

1. For the **Employees** table, write the function which will count
   AVG column Work experience (column `seniority` in db). 
   Then SELECT data about workers, whose `seniority` is greater than 
   the average using this function.
2. Write a function that extracts the key between the tables
   **Street** and **Pharmacy** value of the **Street** `name` field. Then
   SELECT all data from the table **Pharmacy**
   using this feature.
   
### Triggers

1. Ensure the integrity of the values for the database structure.
2. For **Employees** series and passport number (column `passport_series_num`) provide check of 
input format: 2 letters + space + 6 digits;
3. In the **Employees** field `name`, only the following names are allowed: 
   'Василь', 'Іван', 'Галина' and 'Олександра'.
4. Prohibit the removal of streets from the **Street** table.