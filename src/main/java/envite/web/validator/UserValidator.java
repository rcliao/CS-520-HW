package envite.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import envite.model.User;

@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports( Class<?> clazz )
    {
        // clazz is User.class or a subclass of User
        return User.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
        User user = (User) target;

        if( !StringUtils.hasText( user.getUsername() ) )
            errors.rejectValue( "username", "error.username.required" );

        if ( !user.getPassword().equals( user.getPassword2() ) )
            errors.rejectValue( "password2", "error.password.repeat" );

        if( !StringUtils.hasText( user.getPassword() ) )
            errors.rejectValue( "password", "error.password.required" );

        if( !StringUtils.hasText( user.getEmail() ) )
            errors.rejectValue( "email", "error.email.required" );

        if( !StringUtils.hasText( user.getFirstName() ) )
            errors.rejectValue( "firstName", "error.firstName.required" );

        if( !StringUtils.hasText( user.getLastName() ) )
            errors.rejectValue( "lastName", "error.lastName.required" );
    }

}
