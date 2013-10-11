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

@WebServlet("/user/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Registration() {
        super();
    }
    
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// redirect the page
		doPost(request, response);
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

		// if anything is empty
		if (requestUser.getUsername().isEmpty() || requestUser.getPassword().isEmpty() || requestUser.getEmail().isEmpty()
				|| requestUser.getFirstName().isEmpty() || requestUser.getLastName().isEmpty()) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		} else if (requestUser.getUsername().length() < 4) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		} else {
			
			@SuppressWarnings("unchecked")
			List<User> users = (List<User>) getServletContext().getAttribute("users");
			
			users.add(requestUser);
			
			getServletContext().setAttribute("users", users);
			
		}
	}

}
