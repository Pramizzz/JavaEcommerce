// ==== 1. CartItem Model ====
package model;

public class CartItem {
    private int variantId;
    private String productName;
    private String imagePath;
    private double price;
    private int quantity;
    private String variantSize;

    public CartItem() {}
    
    public CartItem(int variantId, String productName, String imagePath, double price, int quantity, String variantSize) {
        this.variantId = variantId;
        this.productName = productName;
        this.imagePath = imagePath;
        this.price = price;
        this.quantity = quantity;
        this.variantSize = variantSize;
    }

    public int getVariantId() { return variantId; }
    public void setVariantId(int variantId) { this.variantId = variantId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getVariantSize() { return variantSize; }
    public void setVariantSize(String variantSize) { this.variantSize = variantSize; }
}