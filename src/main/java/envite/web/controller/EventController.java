package envite.web.controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

import envite.model.User;
import envite.model.Guest;
import envite.model.dao.UserDao;
import envite.model.Event;
import envite.model.dao.EventDao;
import envite.web.validator.EventValidator;

@Controller
@SessionAttributes("event")
public class EventController {

    @Autowired
    UserDao userDao;

    @Autowired
    EventDao eventDao;

    @Autowired
    EventValidator eventValidator;

    @RequestMapping(value = "/create.html", method = RequestMethod.GET)
    public String create( ModelMap models,
                HttpSession session )
    {
        if ( session.getAttribute("loginUser") == null ) return "redirect:/index.html";

        models.put( "event", new Event() );

        return "create";
    }

    @RequestMapping(value="/create.html", method = RequestMethod.POST)
    public @ResponseBody Event created( @RequestBody final Event event,
                HttpSession session ) throws ServletException {   

        User user = (User) session.getAttribute("loginUser");

        event.setCreator(user);

        eventDao.saveEvent( event );

        for ( Guest g : event.getGuests() ) {
            String from = event.getCreator().getEmail();
            String to = g.getEmail();
            String subject = event.getTitle();
            String content = event.getMessage();

            Properties props = System.getProperties();
            props.put( "mail.smtp.host", "localhost" );
            Session session2 = Session.getInstance( props );

            Message msg = new MimeMessage( session2 );
            try
            {
                msg.setFrom( new InternetAddress( from ) );
                msg.setRecipient( RecipientType.TO, new InternetAddress( to ) );
                msg.setSubject( subject );
                msg.setText( content );

                Transport.send( msg );
            }
            catch( Exception e )
            {
                throw new ServletException( e );
            }
        }

        return event;
    }

    @RequestMapping(value = "/events.html", method = RequestMethod.GET)
    public String list( ModelMap models,
                HttpSession session )
    {
        if ( session.getAttribute("loginUser") == null ) return "redirect:/index.html";

        User user = (User) session.getAttribute("loginUser");

        models.put( "events", eventDao.getEvents( user ) );

        return "list";
    }

    @RequestMapping("/editEvent.html")
    public String edit( @RequestParam Integer id, ModelMap models, HttpSession session )
    {
        if ( session.getAttribute("loginUser") == null ) return "redirect:/index.html";

        models.put( "event", eventDao.getEvent( id ) );

        return "edit";
    }

    @RequestMapping(value="/editEvent.html", method = RequestMethod.POST)
    public @ResponseBody Event edited( @RequestBody final Event event,
                HttpSession session ) throws ServletException {

        User user = (User) session.getAttribute("loginUser");

        event.setCreator(user);

        eventDao.saveEvent( event );

        return event;
    }

}
