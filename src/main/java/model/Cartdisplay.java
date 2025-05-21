package model;

public class Cartdisplay {
    private int cartItemId;
    private int variantId;
    private String variantName;
    private int quantity;
    private double price;

    // Constructor
    public Cartdisplay(int cartItemId, int variantId, String variantName, int quantity, double price) {
        this.cartItemId = cartItemId;
        this.variantId = variantId;
        this.variantName = variantName;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters
    public int getCartItemId() { return cartItemId; }
    public int getVariantId() { return variantId; }
    public String getVariantName() { return variantName; }
    public int getQuantity() { return quantity; }
    public double getPrice() { return price; }

    // Setters
    public void setCartItemId(int cartItemId) { this.cartItemId = cartItemId; }
    public void setVariantId(int variantId) { this.variantId = variantId; }
    public void setVariantName(String variantName) { this.variantName = variantName; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setPrice(double price) { this.price = price; }
}
