package controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.User;

@WebServlet("/user/login")
public class BasicAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BasicAuth() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Envite");
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
		
		User requestUser = new User();

		try {
			requestUser = gson.fromJson(jb.toString(), User.class);
		} catch (Exception e) {
			// crash and burn
			throw new IOException("Error parsing JSON request string");
		}
		
		String username = requestUser.getUsername();
		String password = requestUser.getPassword();

		User user = new User();

		@SuppressWarnings("unchecked")
		List<User> registeredUsers = (List<User>) getServletContext()
				.getAttribute("users");

		for (User u : registeredUsers) {
			if (u.getUsername().equals(username)) {
				if (u.getPassword().equals(password)) {
					user = u;
				}
			}
		}

		if (user.getUsername() == null) {
			// failed the login
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED,
					"Username or password not match");
		} else {
			
			

		}
		
		User userJson = new User();
		userJson.setUsername(user.getUsername());
		userJson.setEmail(user.getEmail());
		userJson.setFirstName(user.getFirstName());
		userJson.setLastName(user.getLastName());

		String json = gson.toJson(userJson);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
