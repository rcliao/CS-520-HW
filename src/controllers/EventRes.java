package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;
import models.Guest;
import models.User;

import com.google.gson.Gson;


@WebServlet("/event")
public class EventRes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EventRes() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String authorization = request.getHeader("Authorization");
		
		Gson gson = new Gson();

		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getServletContext().getAttribute("users");
		
		User user = null;
		
		if (authorization == null) {
			@SuppressWarnings("unchecked")
			List<Event> events = (List<Event>) getServletContext().getAttribute("events");
			
			int eventId = Integer.parseInt(request.getParameter("eventId"));
			String guestName = request.getParameter("guestName");
			
			Event e = events.get(eventId);
			
			boolean inEvent = false;
			
			for (Guest g: e.getGuests()) {
				if(g.getName().equals(guestName)) {
					inEvent = true;
				}
			}
			
			if (!inEvent) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				return;
			}

			String json = gson.toJson(e);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else {
			String userInfo = authorization.substring(6).trim();
			
			String username = userInfo.split(":")[0];
			
			for (User u : users) {
				if (u.getUsername().equals(username)) {
					user = u;
				}
			}
		}
		
		if (user == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		} else {
			@SuppressWarnings("unchecked")
			List<Event> events = (List<Event>) getServletContext().getAttribute("events");
			
			int eventId = Integer.parseInt(request.getParameter("eventId"));
			
			Event e = events.get(eventId);

			if (!e.getCreator().getUsername().equals(user.getUsername())) {
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				return;
			}

			String json = gson.toJson(e);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
