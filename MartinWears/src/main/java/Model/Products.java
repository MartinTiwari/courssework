package Model;

public class Products {
    private int productId;
    private String productName;
    private String productImage;
    private String productCategory;
    private String productPrice;
    private String productDescription;
    
    public Products(int productId, String productName, String productImage, String productCategory, String productPrice, String productDescription) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.productCategory = productCategory;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
    }
    
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
    public String getProductImage() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
    public String getProductCategory() {
        return productCategory;
    }
    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }
    public String getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }
    public String getProductDescription() {
        return productDescription;
    }
    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
}
