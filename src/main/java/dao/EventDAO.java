package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import models.Event;

public class EventDAO {
    private Connection connection;

    public EventDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        	this.connection  = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/event_plan_db","root","");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAllEvents() {
        List<Event> events = new ArrayList<>();
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM events")) {
            while (resultSet.next()) {
                Event event = mapResultSetToEvent(resultSet);
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public Event getEventById(int eventId) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE id = ?")) {
            preparedStatement.setInt(1, eventId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return mapResultSetToEvent(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean addEvent(Event event) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO events (name, event_date, descrption) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, event.getName());
            preparedStatement.setDate(2, new java.sql.Date(event.getEventDate().getTime()));
            preparedStatement.setString(3, event.getDescription());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateEvent(Event event) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE events SET name = ?, event_date = ?, descrption = ? WHERE id = ?")) {
            preparedStatement.setString(1, event.getName());
            preparedStatement.setDate(2, new java.sql.Date(event.getEventDate().getTime()));
            preparedStatement.setString(3, event.getDescription());
            preparedStatement.setInt(4, event.getId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteEvent(int eventId) {
        try (PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM events WHERE id = ?")) {
            preparedStatement.setInt(1, eventId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Event mapResultSetToEvent(ResultSet resultSet) throws SQLException {
        Event event = new Event();
        event.setId(resultSet.getInt("id"));
        event.setName(resultSet.getString("name"));
        event.setEventDate(resultSet.getDate("event_date"));
        event.setDescription(resultSet.getString("descrption"));
        return event;
    }

}
