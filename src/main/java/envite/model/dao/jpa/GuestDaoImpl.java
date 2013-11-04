package envite.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import envite.model.Guest;
import envite.model.dao.GuestDao;

@Repository
public class GuestDaoImpl implements GuestDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional
    @Override
    public Guest saveGuest( Guest guest ) {
        return entityManager.merge( guest );
    }
}
