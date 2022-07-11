package com.codflix.backend.features.media;

import com.codflix.backend.core.Database;
import com.codflix.backend.models.Media;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MediaDao {

    // constant for date format
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    // method creating list of media retrieving with sql request table media ordered by date
    public List<Media> getAllMedias() {
        List<Media> medias = new ArrayList<>();

        // new instance of connection to db
        Connection connection = Database.get().getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM media ORDER BY release_date DESC");
            while (rs.next()) {
                medias.add(mapToMedia(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return medias;
    }

    // method to get the search bar to retrieve the media with a part of the title
    public List<Media> filterMedias(String title) {
        List<Media> medias = new ArrayList<>();
        Connection connection = Database.get().getConnection();

        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM media WHERE title LIKE ? ORDER BY release_date DESC");
            st.setString(1, "%" + title + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                medias.add(mapToMedia(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return medias;

       /* try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM media WHERE type=? ORDER BY release_date DESC");
           // st.setString(1, type);
            // PreparedStatement st = connection.prepareStatement("SELECT DISTINCT m.id, m.genre_id, m.title, m.type, m.status, m.release_date, m.summary, m.trailer_url FROM media m, genre WHERE title LIKE ? OR type = ? OR m.genre_id=genre.id AND genre.name=? OR m.release_date > ? ORDER BY release_date DESC;");
            //st.setString(1, "%"+ title + "%", type, release_date, genre.name, release_date );

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                medias.add(mapToMedia(rs));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }*/

    }


    public Media getMediaById(int id) {
        Media media = null;

        Connection connection = Database.get().getConnection();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM media WHERE id=?");

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                media = mapToMedia(rs);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }

        return media;
    }

    private Media mapToMedia(ResultSet rs) throws SQLException, ParseException {
        return new Media(
                rs.getInt(1), // id
                rs.getInt(2), // genre_id
                rs.getString(3), // title
                rs.getString(4), // type
                rs.getString(5), // status
                DATE_FORMAT.parse(rs.getString(6)), // release_date
                rs.getString(7), // summary
                rs.getString(8) // trailer_url
        );
    }
}
