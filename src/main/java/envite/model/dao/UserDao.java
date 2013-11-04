package envite.model.dao;

import java.util.List;

import envite.model.User;

public interface UserDao {

    User getUser( Integer id );

    List<User> getUsers();
    
    User getUser( String username );

    User saveUser( User user );
}