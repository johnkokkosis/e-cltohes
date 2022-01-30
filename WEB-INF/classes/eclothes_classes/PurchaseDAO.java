package eclothes_classes;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {

    public void createNewPurchase(Purchase purchase) throws Exception {
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "INSERT INTO purchases (purchases.purchase_date, purchases.card_number, purchases.exp_date, purchases.card_cvv, purchases.card_type, purchases.purchase_from_user, purchases.purchase_for_product) "
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, purchase.getPurchaseDate());
            stmt.setString(2, purchase.getCardNumber());
            stmt.setString(3, purchase.getExpDate());
            stmt.setString(4, purchase.getCvv());
            stmt.setString(5, purchase.getCardType());
            stmt.setInt(6, purchase.getPurchaseFromUserId());
            stmt.setInt(7, purchase.getPurchaseFroProductId());

            stmt.executeUpdate();
            stmt.close();
            db.close();
        } catch (Exception e) {
            throw new Exception("Purchase cannot be processed! Please try later.");
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    }

    public List<Purchase> getAllUserPurchases(int userId) throws Exception {
        List<Purchase> purchases = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt1 = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM purchases WHERE purchases.purchase_from_user=?";

        try {
            con = db.getConnection();
            stmt1 = con.prepareStatement(sql);
            stmt1.setInt(1, userId);

            rs = stmt1.executeQuery();

            while (rs.next()) {
                purchases.add(
                        new Purchase(
                                rs.getString("purchases.purchase_date"),
                                rs.getString("purchases.card_number"),
                                rs.getString("purchases.exp_date"),
                                rs.getString("purchases.card_cvv"),
                                rs.getString("purchases.card_type"),
                                rs.getInt("purchases.purchase_from_user"),
                                rs.getInt("purchases.purchase_for_product")
                        )
                );
            }

            rs.close();
            stmt1.close();
            db.close();

            return purchases;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    }

}
