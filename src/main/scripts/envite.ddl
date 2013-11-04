
    create table events (
        id int4 not null,
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
        name varchar(255),
        respond boolean not null,
        primary key (id)
    );

    create table users (
        id int4 not null,
        email varchar(255),
        firstName varchar(255),
        lastName varchar(255),
        password varchar(255),
        username varchar(255) not null unique,
        primary key (id)
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

    create sequence hibernate_sequence;
