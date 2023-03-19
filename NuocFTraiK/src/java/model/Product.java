/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dell
 */
public class Product {
    private int id;
    private String name;
    private String describe;
    private double price;
    private String image;
    private int categoryId;
    private String origin;
    private int status;

    public Product() {
    }

    public Product(int id, String name, String describe, double price, String image, int categoryId, String origin, int status) {
        this.id = id;
        this.name = name;
        this.describe = describe;
        this.price = price;
        this.image = image;
        this.categoryId = categoryId;
        this.origin = origin;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", describe=" + describe + ", price=" + price + ", image=" + image + ", categoryId=" + categoryId + ", origin=" + origin + ", status=" + status + '}';
    }
    
    
   
   

    
}
