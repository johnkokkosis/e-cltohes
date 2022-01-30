package eclothes_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class ProductDAO {

    public List<Product> getProducts() throws Exception{
        List<Product> products = new ArrayList<>();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM products;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();

            while (rs.next()) {
                products.add(
                        new Product(
                                rs.getString("products.product_id"),
                                rs.getString("products.product_name"),
                                rs.getString("products.product_description"),
                                rs.getString("products.product_price"),
                                rs.getString("products.product_availability"),
                                rs.getString("products.product_image")
                        )
                );
            }

            rs.close();
            stmt.close();
            db.close();

            return products;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            }catch (Exception ignore){

            }
        }
    }

    public Product getProductByID(String productId) throws Exception{
        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt1 = null;
        ResultSet rs = null;
        String sql1 = "SELECT * FROM products WHERE products.product_id=?";

        try {
            con = db.getConnection();
            stmt1 = con.prepareStatement(sql1);

            // setting parameter
            stmt1.setString(1, productId);

            rs = stmt1.executeQuery();

            if (!rs.next()){
                rs.close();
                stmt1.close();
                throw new Exception("There is no product with id: " + productId);
            }

            Product product = new Product(
                    rs.getString("products.product_id"),
                    rs.getString("products.product_name"),
                    rs.getString("products.product_description"),
                    rs.getString("products.product_price"),
                    rs.getString("products.product_availability"),
                    rs.getString("products.product_image")
            );

            rs.close();
            stmt1.close();
            db.close();

            return product;
        }catch (Exception e){
            throw new Exception(e.getMessage());
        } finally {
            try{
                db.close();
            }catch (Exception ignore){

            }
        }
    }
}
