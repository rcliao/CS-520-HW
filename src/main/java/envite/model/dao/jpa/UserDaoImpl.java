package envite.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import envite.model.User;
import envite.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser( Integer id )
    {
        return entityManager.find( User.class, id );
    }

    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User order by id", User.class )
            .getResultList();
    }

	@Override
	public User getUser( String username ) {
		return entityManager.createQuery( "SELECT c FROM User c WHERE c.username LIKE :name", User.class)
		        .setParameter("name", username)
	            .getSingleResult();
	}

    @Transactional
    @Override
    public User saveUser( User user ) {
        return entityManager.merge( user );
    }
}