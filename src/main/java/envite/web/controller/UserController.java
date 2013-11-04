package envite.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;

import envite.model.User;
import envite.model.dao.UserDao;
import envite.web.validator.UserValidator;

@Controller
@SessionAttributes("user")
public class UserController {

    @Autowired
    UserDao userDao;

    @Autowired
    UserValidator userValidator;

    @RequestMapping(value= "/login.html", method = RequestMethod.POST)
    public String login( @ModelAttribute User user,
                ModelMap models,
                HttpSession session )
    {
        User userInDB = userDao.getUser( user.getUsername() );

        if ( user.getPassword().equals(userInDB.getPassword() ) )
        {
            session.setAttribute("loginUser", userInDB);

            return "redirect:/index.html";
        }
        else
        {
            models.put( "error", "Username and password not match" );

            return "index";
        }

    }

    @RequestMapping(value= "/logout.html", method = RequestMethod.GET)
    public String logout( @ModelAttribute User user,
                HttpSession session )
    {
        session.invalidate();

        return "redirect:/index.html";

    }

    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public String add1( ModelMap models )
    {
        models.put( "user", new User() );
        return "index";
    }

    @RequestMapping(value = "/index.html", method = RequestMethod.POST)
    public String add2( @ModelAttribute User user, BindingResult bindingResult,
                HttpSession session, ModelMap models )
    {
        userValidator.validate( user, bindingResult );
        if( bindingResult.hasErrors() ) {
            models.put( "signupError", "SignupError" );
            return "index";
        }

        userDao.saveUser( user );

        session.setAttribute( "loginUser", user );

        return "redirect:/index.html";
    }

}
