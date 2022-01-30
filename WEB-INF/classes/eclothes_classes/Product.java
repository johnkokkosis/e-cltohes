package eclothes_classes;

public class Product {
    private String code;
    private String brand;
    private String description;
    private String price;
    private String availability;
    private String imageURL;

    public Product(String code, String brand, String description, String price, String availability, String imageURL) {
        this.code = code;
        this.brand = brand;
        this.description = description;
        this.price = price;
        this.availability = availability;
        this.imageURL = imageURL;
    }

    public String getCode() {
        return code;
    }

    public String getBrand() {
        return brand;
    }

    public String getDescription() {
        return description;
    }

    public String getPrice() {
        return price;
    }

    public String getAvailability() {
        return availability;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
