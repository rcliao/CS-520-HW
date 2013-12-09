
    create table authorities (
        username varchar(255) not null,
        authority varchar(255)
    );

    create table events (
        id int4 not null,
        banner oid,
        message varchar(255),
        title varchar(255),
        creator_id int4,
        primary key (id)
    );

    create table events_guests (
        events_id int4 not null,
        guests_id int4 not null,
        unique (guests_id)
    );

    create table guests (
        id int4 not null,
        email varchar(255),
        emailed boolean not null,
        name varchar(255),
        respond boolean not null,
        primary key (id)
    );

    create table users (
        id int4 not null,
        email varchar(255),
        enabled boolean not null,
        firstName varchar(255),
        lastName varchar(255),
        password varchar(255),
        username varchar(255) not null unique,
        primary key (id),
        unique (username)
    );

    create table users_guests (
        users_id int4 not null,
        guests_id int4 not null
    );

    alter table events 
        add constraint FKB307E1197949099F 
        foreign key (creator_id) 
        references users;

    alter table events_guests 
        add constraint FK8C59EB818589B511 
        foreign key (guests_id) 
        references guests;

    alter table events_guests 
        add constraint FK8C59EB81BC3E0D95 
        foreign key (events_id) 
        references events;

    alter table users_guests 
        add constraint FKD05AA3B28589B511 
        foreign key (guests_id) 
        references guests;

    alter table users_guests 
        add constraint FKD05AA3B2173DDE43 
        foreign key (users_id) 
        references users;

    create sequence hibernate_sequence minvalue 1000;
    
    /* 
     * Add a user cysun with password abcd and email cysun@localhost.localdomain.
     * Add an event that was created by cysun.
     * Add two guests to the event created by cysun.
     */
    
    INSERT INTO users
                VALUES (1,
                'cysun@localhost.localdomain',
                true,
                'Chengyu',
                'Sun',
                'abcd',
        'cysun');

    INSERT INTO authorities
                VALUES ('cysun', 'admin');

    INSERT INTO events
                VALUES (1,
                null,
                'Welcome to Halloween Party',
                'Happy Halloween',
                1);

    INSERT INTO guests
                VALUES (1,
                'rcliao01@gmail.com',
                false,
                'Eric',
                false);


    INSERT INTO guests
                VALUES (2,
                'rcliao01@gmail.com',
                false,
                'Eric2',
                false);

    INSERT INTO events_guests
                VALUES (1, 1);

    INSERT INTO events_guests
                VALUES (1, 2);

    INSERT INTO users_guests
                VALUES (1, 1);

    INSERT INTO users_guests
                VALUES (1, 2);