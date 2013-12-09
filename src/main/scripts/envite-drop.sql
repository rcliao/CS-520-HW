    alter table events 
        drop constraint FKB307E1197949099F;

    alter table events_guests 
        drop constraint FK8C59EB818589B511;

    alter table events_guests 
        drop constraint FK8C59EB81BC3E0D95;

	drop table authorities;

    drop table events;

    drop table events_guests;

    drop table guests;

    drop table users;

    drop sequence hibernate_sequence;