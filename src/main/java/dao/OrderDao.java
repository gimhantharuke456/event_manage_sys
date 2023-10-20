package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Order;

public class OrderDao {
    private Connection connection;

    public OrderDao() {
     
    	 try {
             Class.forName("com.mysql.jdbc.Driver");
         } catch (ClassNotFoundException e) {
             e.printStackTrace();
         }
         try {
             this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/medication_store", "root", "");
         } catch (SQLException e) {
             e.printStackTrace();
         }
    }

    public boolean createOrder(Order order) {
        // Logic to create a new order
        String query = "INSERT INTO orders (ordered_by, ordered_at, address,item_name) VALUES (?, ?, ?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, order.getOrderedBy());
            preparedStatement.setTimestamp(2, order.getOrderedAt());
            preparedStatement.setString(3, order.getAddress());
            preparedStatement.setString(4, order.getItemName());
            return preparedStatement.executeUpdate() > 0; // Returns true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateOrder(Order order) {
        
        String query = "UPDATE orders SET ordered_by = ?, ordered_at = ?, address = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, order.getOrderedBy());
            preparedStatement.setTimestamp(2, order.getOrderedAt());
            preparedStatement.setString(3, order.getAddress());
            preparedStatement.setInt(4, order.getId());
            return preparedStatement.executeUpdate() > 0; // Returns true if update is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteOrder(int orderId) {
        // Logic to delete order
        String query = "DELETE FROM orders WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderId);
            return preparedStatement.executeUpdate() > 0; // Returns true if deletion is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Order getOrderById(int orderId) {
        // Logic to retrieve order by id
        String query = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String orderedBy = resultSet.getString("ordered_by");
                Timestamp orderedAt = resultSet.getTimestamp("ordered_at");
                String address = resultSet.getString("address");

                return new Order(orderId, orderedBy, orderedAt, address,resultSet.getString("item_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if order not found
    }

    public List<Order> getAllOrders() {
        // Logic to retrieve all orders
        List<Order> orders = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM orders");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int orderId = resultSet.getInt("id");
                String orderedBy = resultSet.getString("ordered_by");
                Timestamp orderedAt = resultSet.getTimestamp("ordered_at");
                String address = resultSet.getString("address");
                
                orders.add(new Order(orderId, orderedBy, orderedAt, address,resultSet.getString("item_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}
