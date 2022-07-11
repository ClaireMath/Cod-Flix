package com.codflix.backend.features.other;

import com.codflix.backend.core.Conf;
import com.codflix.backend.core.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import spark.Request;
import spark.Response;
import spark.Session;

import java.util.HashMap;
import java.util.Map;

public class ContactController {
    private static final Logger logger = LoggerFactory.getLogger(ContactController.class);

    // private final ContactDao userDao = new ContactDao();

    public String contact(Request request, Response response) {

        Map<String, Object> model = new HashMap<>();
        return Template.render("contact.html", model);
    }


     /*   // Get parameters
        Map<String, String> query = URLUtils.decodeQuery(request.body());
        String email = query.get("email");
        String message = query.get("message");
*/
    // Redirect to medias page
    // response.redirect(Conf.ROUTE_LOGGED_ROOT);
    // return "OK";
}
