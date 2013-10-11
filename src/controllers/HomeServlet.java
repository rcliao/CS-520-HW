package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;
import models.User;

@WebServlet("/Envite")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public HomeServlet() {
        super();
    }
    
    public void init( ServletConfig config ) throws ServletException
    {
        super.init( config );

        List<User> users = new ArrayList<User>();
        List<Event> events = new ArrayList<Event>();
        
        User me = new User();
        me.setUsername("rcliao");
        me.setEmail("rcliao01@gmail.com");
        me.setPassword("abcd");
        me.setFirstName("Eric");
        me.setLastName("Liao");
        
        users.add(me);
        
        getServletContext().setAttribute( "users", users );
        getServletContext().setAttribute( "events", events );
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/index.html").forward(request,
				response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
