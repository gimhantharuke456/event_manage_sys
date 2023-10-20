package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Supplier;

public class SupplierDao {
 private  final String SELECT_ALL_SUPPLIERS = "SELECT * FROM suppliers";
 private  final String SELECT_SUPPLIER_BY_EMAIL = "SELECT * FROM suppliers WHERE email=?";
 private  final String INSERT_SUPPLIER = "INSERT INTO suppliers (email, name, address, contactNumber) VALUES (?, ?, ?, ?)";
 private final String UPDATE_SUPPLIER = "UPDATE suppliers SET name=?, address=?, contactNumber=? WHERE email=?";
 private final String DELETE_SUPPLIER = "DELETE FROM suppliers WHERE email=?";
 
 private Connection connection;

 public SupplierDao() {
  
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

 public List<Supplier> getAllSuppliers() {
	 
     List<Supplier> suppliers = new ArrayList<>();

     try (
    		 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUPPLIERS);
          ResultSet resultSet = preparedStatement.executeQuery()) {

         while (resultSet.next()) {
             String email = resultSet.getString("email");
             String name = resultSet.getString("name");
             String address = resultSet.getString("address");
             String contactNumber = resultSet.getString("contactNumber");

             Supplier supplier = new Supplier(email, name, address, contactNumber);
             suppliers.add(supplier);
         }
     } catch (SQLException e) {
         e.printStackTrace(); // Handle exceptions appropriately
     }

     return suppliers;
 }

 public Supplier getSupplierByEmail(String email) {
     Supplier supplier = null;

     try (
          PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPPLIER_BY_EMAIL)) {
         preparedStatement.setString(1, email);

         try (ResultSet resultSet = preparedStatement.executeQuery()) {
             if (resultSet.next()) {
                 String name = resultSet.getString("name");
                 String address = resultSet.getString("address");
                 String contactNumber = resultSet.getString("contactNumber");

                 supplier = new Supplier(email, name, address, contactNumber);
             }
         }
     } catch (SQLException e) {
         e.printStackTrace(); // Handle exceptions appropriately
     }

     return supplier;
 }

 public void addSupplier(Supplier supplier) {
     try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUPPLIER)) {
         preparedStatement.setString(1, supplier.getEmail());
         preparedStatement.setString(2, supplier.getName());
         preparedStatement.setString(3, supplier.getAddress());
         preparedStatement.setString(4, supplier.getContactNumber());

         preparedStatement.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace(); // Handle exceptions appropriately
     }
 }

 public void updateSupplier(Supplier supplier) {
     try (
          PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SUPPLIER)) {
         preparedStatement.setString(1, supplier.getName());
         preparedStatement.setString(2, supplier.getAddress());
         preparedStatement.setString(3, supplier.getContactNumber());
         preparedStatement.setString(4, supplier.getEmail());

         preparedStatement.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace(); // Handle exceptions appropriately
     }
 }

 public void deleteSupplier(String email) {
     try (
          PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SUPPLIER)) {
         preparedStatement.setString(1, email);

         preparedStatement.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace(); // Handle exceptions appropriately
     }
 }
}
