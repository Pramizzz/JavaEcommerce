package model;

public class CartItem {
    private int variantId;
    private String productName;
    private String variantSize;
    private double price;
    private int quantity;
    private String imagePath; // ✅ Add this line

    public CartItem() {}

    public CartItem(int variantId, String productName, String variantSize, double price, int quantity, String imagePath) {
        this.variantId = variantId;
        this.productName = productName;
        this.variantSize = variantSize;
        this.price = price;
        this.quantity = quantity;
        this.imagePath = imagePath; // ✅ Add this line
    }

    // Getters and Setters
    public int getVariantId() { return variantId; }
    public void setVariantId(int variantId) { this.variantId = variantId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getVariantSize() { return variantSize; }
    public void setVariantSize(String variantSize) { this.variantSize = variantSize; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getImagePath() { return imagePath; } // ✅ Getter
    public void setImagePath(String imagePath) { this.imagePath = imagePath; } // ✅ Setter
}
