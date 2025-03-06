# 3. Conceptual ERD to words
## This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.

### course structure
 #### a. Describe the entities in this conceptual ERD.
 #### b. Write out the relationship labels.
 #### c. Describe the relationships between the entities (one-to-many, one-to-one and many-to-many).
 #### d. Define the relationship statement for example: "A Customer can have one or more Rentals".

 a. Diagrammet innehåller tre entiteter:
 1. Custumer - representerar kunder som hyr bilar.
 2. Rental - representerar uthyrningstransaktioner.
 3. Car - representerar bilar som hyrs ut. 

 b. Diagrammet visar relationer, men har inga etiketter. Om vi skulle ge dom etiketter: 
 Custumer 'makes' rental.
 Rental 'includes' Car

 c. 
 1. custumer --> rental
 - en kund kan ha flera uthyrningar |<
 - varje uthyrning tillhör exakt en kund.
 2. rental --> car
 - en uthyrning involverar en bil ||
 - en bil kan hyras flera gånger, men i varje uthyrning är den kopplad till exakt en bil.

 d. 
 formatera relationerna i ord.
 1. 'en kund kan ha en eller flera uthyrningar, men varje uthyrning tillhör exakt en kund'
 2. 'en uthyrning inkluderar exakt en bil, men en bil kan hyras flera gånger genom olika uthyrningar'.

 

