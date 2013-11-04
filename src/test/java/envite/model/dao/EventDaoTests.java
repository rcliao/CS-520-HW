package envite.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "EventDaoTests")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class EventDaoTests extends AbstractTransactionalTestNGSpringContextTests {
	
	@Autowired
    UserDao userDao;
	
	@Autowired
    EventDao eventDao;
	
	@Test
    public void getEvent()
    {
        assert eventDao.getEvents( userDao.getUser("cysun") ).size() >= 1;
    }
	
	@Test
    public void getEventGuests()
    {
    	assert eventDao.getEvents( userDao.getUser(1) ).get(0).getGuests().size() == 2;
    }
}
