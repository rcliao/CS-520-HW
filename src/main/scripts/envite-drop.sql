
ALTER TABLE events_guests
	DROP constraint FK8C59EB81BC3E0D95;

ALTER TABLE events_guests
	DROP constraint FK8C59EB818589B511;

ALTER TABLE events
	DROP constraint FKB307E1197949099F;

drop table events;

drop table events_guests;

drop table guests;

drop table users;

drop sequence hibernate_sequence;