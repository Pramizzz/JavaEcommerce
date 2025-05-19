package model;

public class ProductVariantModel {
    private String size;
    private String color;
    private int stockQuantity;

    public ProductVariantModel(String size, String color, int stockQuantity) {
        this.size = size;
        this.color = color;
        this.stockQuantity = stockQuantity;
    }

    public String getSize() {
        return size;
    }

    public String getColor() {
        return color;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }
}
