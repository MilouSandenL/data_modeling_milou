SET search_path TO ezecream_05;

INSERT INTO 
    ezecream_05.customer (first_name, last_name, email, address)
VALUES
    (
        'Ragnar',
        'Lothbrok',
        'ragnar@kattegat.com',
        '1 Valhalla Way'
    ),
    (
        'Lagertha',
        'Lothbrok',
        'lagertha@kattegat.com',
        '2 Shieldmaiden Road'
    ),
    (
        'Bjorn',
        'Ironside',
        'bjorn@kattegat.com',
        '3 Viking Bay'
    ),
    (
        'Ivar',
        'the Boneless',
        'ivar@danes.com',
        '4 The Great Heathen Army Camp'
    );

-- DELETE ON CASCADE FROM ezecream_05.customer WHERE customer_id = 50;

INSERT INTO 
    ezecream_05.customer (customer_id, first_name, last_name, personal_number, email, address)
VALUES
    (
        50,
        'Anna',
        'Annasson',
        '567890123456',  -- Lagt till ett exempel på personal_number
        'Anna@annasson.com',
        'Stockholmsvägen 36'
    );

SELECT * FROM ezecream_05.customer;
