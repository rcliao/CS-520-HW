package envite.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import envite.model.Event;

@Component
public class EventValidator implements Validator {

    @Override
    public boolean supports( Class<?> clazz )
    {
        return Event.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
        Event event = (Event) target;

        if( !StringUtils.hasText( event.getTitle() ) )
            errors.rejectValue( "title", "error.title.required" );

        if( !StringUtils.hasText( event.getMessage() ) )
            errors.rejectValue( "message", "error.message.required" );

        if( event.getGuests().size() < 1 )
            errors.rejectValue( "guests", "error.guests.required" );
    }

}
