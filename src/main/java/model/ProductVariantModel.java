package model;

public class ProductVariantModel {
    private int variantId;
    private int productId;
    private String size;
    private String color;
    private int stockQuantity;
    private String name;
    // Additional fields
    private String productName;
    private double price;

    // Constructors
    public ProductVariantModel() {}

    public ProductVariantModel(int variantId, int productId, String size, String color, int stockQuantity, String productName, double price) {
        this.variantId = variantId;
        this.productId = productId;
        this.size = size;
        this.color = color;
        this.stockQuantity = stockQuantity;
        this.productName = productName;
        this.price = price;
    }
    public String getName() {
        return name;
    }
    // Getters and Setters
    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}