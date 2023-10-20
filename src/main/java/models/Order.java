package models;

import java.sql.Timestamp;

public class Order {
    private int id;
    private String orderedBy;
    private String itemName;
    private Timestamp orderedAt;
    private String address; // Additional field

    // Constructors
    public Order() {
    }

    public Order(int id, String orderedBy, Timestamp orderedAt, String address,String itemName) {
        this.id = id;
        this.orderedBy = orderedBy;
        this.orderedAt = orderedAt;
        this.address = address;
        this.itemName = itemName;
    }

    // Getters and Setters
    
    public String getItemName() {
    	return this.itemName;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setItemName(String name) {
    	itemName = name;
    }

    public String getOrderedBy() {
        return orderedBy;
    }

    public void setOrderedBy(String orderedBy) {
        this.orderedBy = orderedBy;
    }

    public Timestamp getOrderedAt() {
        return orderedAt;
    }

    public void setOrderedAt(Timestamp orderedAt) {
        this.orderedAt = orderedAt;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
