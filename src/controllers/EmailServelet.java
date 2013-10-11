package controllers;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;
import models.Guest;

@WebServlet("/email/send")
public class EmailServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmailServelet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int eventId = Integer.parseInt(request.getParameter("eventId"));
		String[] emailListing = request.getParameterValues("emails");
		String message = request.getParameter("message");
		
		@SuppressWarnings("unchecked")
		List<Event> events = (List<Event>) getServletContext().getAttribute("events");
		
		Event currentEvent = events.get(eventId);
		
		for (Guest g : currentEvent.getGuests()) {
			for (String email: emailListing ) {
				if (email.equals(g.getEmail())) {
					String from = currentEvent.getCreator().getEmail();
			        String to = g.getEmail();
			        String subject = currentEvent.getTitle();

			        Properties props = System.getProperties();
			        props.put( "mail.smtp.host", "localhost" );
			        Session session = Session.getInstance( props );

			        Message msg = new MimeMessage( session );
			        try
			        {
			            msg.setFrom( new InternetAddress( from ) );
			            msg.setRecipient( RecipientType.TO, new InternetAddress( to ) );
			            msg.setSubject( subject );
			            msg.setText( message );

			            Transport.send( msg );
			        }
			        catch( Exception e )
			        {
			            throw new ServletException( e );
			        }
				}
			}
		}
	}

}
