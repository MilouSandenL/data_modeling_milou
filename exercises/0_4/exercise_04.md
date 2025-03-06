# 4. Online store
## You are designing a database for an online store that sells multiple products. Customers can place multiple orders, and each order contains multiple products.
### a. Identify entities and their relationships
### b. Create a conceptual ERD with cardinalities

a. identifiera entiteter och relationer
1. Custumer - kunden som gör beställningar.
2. Order - En kund kan göra flera beställningar.
3. Product - flera produkter kan finnas i flera beställningar.
4. order_product - en associativ entitet mellan order och product eftersom en beställning kan innehålla flera produkter och en produkt kan finnas i flera beställningar (M:M relation) många till många.

b. skapa ett jonceptuellt ERD med cardinalities
1. en kund kan ha flera beställningar, men en beställning kan bara tillhöra exakt en kund (|<).
2. en beställning kan innehålla flera produkter, och en produkt kan ingå i flera beställningar (M:M)
3. order_produkt hanterar den M:M-relationen mellan order och product.

<img src = "../../assets/exercise_04.png" width=300>
