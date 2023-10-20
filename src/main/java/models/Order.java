package models;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int orderedBy;
    private Timestamp orderedAt;

    // Constructors
    public Order() {
    }

    public Order(int id, int orderedBy, Timestamp orderedAt) {
        this.id = id;
        this.orderedBy = orderedBy;
        this.orderedAt = orderedAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderedBy() {
        return orderedBy;
    }

    public void setOrderedBy(int orderedBy) {
        this.orderedBy = orderedBy;
    }

    public Timestamp getOrderedAt() {
        return orderedAt;
    }

    public void setOrderedAt(Timestamp orderedAt) {
        this.orderedAt = orderedAt;
    }
}
