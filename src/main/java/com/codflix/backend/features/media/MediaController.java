package com.codflix.backend.features.media;

import com.codflix.backend.core.Template;
import com.codflix.backend.models.Media;
import spark.Request;
import spark.Response;
import spark.Session;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MediaController {
    private final MediaDao mediaDao = new MediaDao();

    public String list(Request request, Response response) {
        List<Media> medias;

        // There was a typo in the param string, preventing the research to work
        String title = request.queryParams("title");
        /*String type = request.queryParams("type");
        String genre = request.queryParams("genre");
        System.out.println("title : "+title);
        System.out.println("type : " + type);
        System.out.println(genre);*/

        if (title != null && !title.isEmpty()) {
            medias = mediaDao.filterMedias(title);
        } else {
            medias = mediaDao.getAllMedias();
        }

      /*  if (type != null && !type.isEmpty()) {
            medias = mediaDao.filterMedias(type);
        } else {
            medias = mediaDao.getAllMedias();
        }*/

        Map<String, Object> model = new HashMap<>();
        model.put("medias", medias);
        return Template.render("media_list.html", model);
    }

        // method retrieving the Media id and sending to media detail page
    public String detail(Request request, Response res) {
        int id = Integer.parseInt(request.params(":id"));
        Media media = mediaDao.getMediaById(id);

        Map<String, Object> model = new HashMap<>();
        model.put("media", media);
        return Template.render("media_detail.html", model);
    }
}
