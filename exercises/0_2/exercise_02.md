# 2. Library Bookly

## A library called Bookly keeps track of books and members who borrow them. Each book has a title, author, and ISBN number. Each member has a membership ID, name, and contact information. A member can borrow multiple books, but each book can be borrowed by only one member at a time.

### a. Identify the entities and attributes for each entity.

### b. Determine the relationship between member and books.

### c. Draw a conceptual ERD using crow foots notation.

# a.

två huvudsakliga entiteter, book och member. Sedan måste vi ha en tredje entitet(mellan entiteterna book och member.)

Book table

| book_id | title  | autor        | isbn     |
| ------- | ------ | ------------ | -------- |
| 1       | Havet  | Andersson A. | 123-4567 |
| 2       | Himlen | Beritssin B. | 891-2345 |
| 3       | Jorden | Carlsson C.  | 678-9123 |

Members table

| member_id | name            | contact_info       |
| --------- | --------------- | ------------------ |
| 1         | Karin Karinsson | Kungsgatan 10      |
| 2         | Bert Bertilsson | Drottningsgatan 15 |
| 3         | Kalle Karlsson  | Götgatan 20        |

Loan table (relationen mellan de två entiteterna)

| loan_id | member_id | book_id | loan_date  | return_date |
| ------- | --------- | ------- | ---------- | ----------- |
| 1       | 2         | 2       | 2024-01-12 | 2024-02-28  |
| 2       | 3         | 1       | 2024-02-05 | 2024-03-04  |
| 3       | 1         | 3       | 2024-01-02 | 2024-02-20  |

## Conceptual ERD
<img src="../../assets/bookly_02.png" width=400>



