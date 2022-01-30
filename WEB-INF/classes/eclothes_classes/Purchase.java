package eclothes_classes;

public class Purchase {
    private String purchaseDate;
    private String cardNumber;
    private String expDate;
    private String cvv;
    private String cardType;
    private int purchaseFromUserId;
    private int purchaseFroProductId;

    public Purchase(String purchaseDate, String cardNumber, String expDate, String cvv, String cardType, int purchaseFromUserId, int purchaseFroProductId) {
        this.purchaseDate = purchaseDate;
        this.cardNumber = cardNumber;
        this.expDate = expDate;
        this.cvv = cvv;
        this.cardType = cardType;
        this.purchaseFromUserId = purchaseFromUserId;
        this.purchaseFroProductId = purchaseFroProductId;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getExpDate() {
        return expDate;
    }

    public String getCvv() {
        return cvv;
    }

    public String getCardType() {
        return cardType;
    }

    public int getPurchaseFromUserId() {
        return purchaseFromUserId;
    }

    public int getPurchaseFroProductId() {
        return purchaseFroProductId;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public void setPurchaseFromUserId(int purchaseFromUserId) {
        this.purchaseFromUserId = purchaseFromUserId;
    }

    public void setPurchaseFroProductId(int purchaseFroProductId) {
        this.purchaseFroProductId = purchaseFroProductId;
    }
}
