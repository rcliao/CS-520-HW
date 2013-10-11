package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Event;
import models.User;

@WebServlet("/event/list")
public class EventList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EventList() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String authorization = request.getHeader("Authorization");
		
		Gson gson = new Gson();

		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getServletContext().getAttribute("users");
		
		User user = null;
		
		if (authorization == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			return;
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
			
			List<Event> results = new ArrayList<Event>();
			
			for ( Event e : events ) {
				if (e.getCreator().getUsername().equals(user.getUsername())) {
					results.add(e);
				}
			}
			
			String json = gson.toJson(results);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
