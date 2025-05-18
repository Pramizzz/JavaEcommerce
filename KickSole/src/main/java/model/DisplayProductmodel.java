package model;

import java.util.List;

public class DisplayProductmodel {
    private int productId;
    private String productName;
    private int brandId;
    private int categoryId;
    private double price;

    private String variantSize;
    private String variantColor;
    private int variantStock;

    private List<String> imagePaths; // New field

    // Getters and setters
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public int getBrandId() {
        return brandId;
    }
    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }
    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public String getVariantSize() {
        return variantSize;
    }
    public void setVariantSize(String variantSize) {
        this.variantSize = variantSize;
    }

    public String getVariantColor() {
        return variantColor;
    }
    public void setVariantColor(String variantColor) {
        this.variantColor = variantColor;
    }

    public int getVariantStock() {
        return variantStock;
    }
    public void setVariantStock(int variantStock) {
        this.variantStock = variantStock;
    }

    public List<String> getImagePaths() {
        return imagePaths;
    }
    public void setImagePaths(List<String> imagePaths) {
        this.imagePaths = imagePaths;
    }
}
