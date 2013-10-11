package controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;
import models.Guest;

import com.google.gson.Gson;

@WebServlet("/event/create")
public class EventResource extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EventResource() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		StringBuffer jb = new StringBuffer();
		String line = null;
		Gson gson = new Gson();
		
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				jb.append(line);
		} catch (Exception e) { /* report an error */
		}
		
		Event requestEvent = new Event();

		try {
			requestEvent = gson.fromJson(jb.toString(), Event.class);
		} catch (Exception e) {
			// crash and burn
			throw new IOException("Error parsing JSON request string");
		}
		
		@SuppressWarnings("unchecked")
		List<Event> events = (List<Event>) getServletContext().getAttribute("events");
		
		events.add(requestEvent);
		
		getServletContext().setAttribute("events", events);
		
		List<Guest> guests = requestEvent.getGuests();
		
		for (Guest g : guests) {
			String from = requestEvent.getCreator().getEmail();
	        String to = g.getEmail();
	        String subject = requestEvent.getTitle();
	        String content = requestEvent.getMessage();

	        Properties props = System.getProperties();
	        props.put( "mail.smtp.host", "localhost" );
	        Session session = Session.getInstance( props );

	        Message msg = new MimeMessage( session );
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
	}

}
