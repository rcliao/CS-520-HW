package envite.model.dao;

import java.util.List;

import envite.model.Event;
import envite.model.User;

public interface EventDao {

	Event getEvent( Integer id );

    List<Event> getEvents( User user );

    Event saveEvent( Event event );

}