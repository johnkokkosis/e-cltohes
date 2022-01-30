package exercise3_2021_2022_8130100;


import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;


/**
 * UserDAO provides all the necessary methods related to users.
 *
 * @author Konstantinos Moulopoulos
 */
public class UserDAO {

    /**
     * This method returns a List with all Users
     *
     * @return List<User>
     */
    public List<User> getUsers() throws Exception {
        List<User> users = new ArrayList<>();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM users_ex3_8130100_2021_2022;";

        try {
            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            rs = stmt.executeQuery();

            while (rs.next()) {
                users.add(
                        new User(
                                rs.getString("username"),
                                rs.getString("firstname"),
                                rs.getString("lastname"),
                                rs.getString("email"),
                                rs.getString("password")
                        )
                );
            }

            rs.close();
            stmt.close();
            db.close();

            return users;
        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {
            try {
                db.close();
            } catch (Exception ignored) {

            }
        }
    } //End of getUsers

    /**
     * Search user by username
     *
     * @param username, String
     * @return User, the User object or null
     * @throws Exception e
     */
    public User findUser(String username) throws Exception {
        User user = null;

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt1 = null;
        ResultSet rs = null;
        String sql1 = "SELECT * FROM users_ex3_8130100_2021_2022 WHERE username = ?;";

        try {
            con = db.getConnection();
            stmt1 = con.prepareStatement(sql1);

            // Set parameter in the query
            stmt1.setString(1, username);

            rs = stmt1.executeQuery();

            if (!rs.next()) {
                rs.close();
                stmt1.close();
                return null;
            }

            user = new User(
                    rs.getString("username"),
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("password")
            );

            return user;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignored) {

            }
        }

    } //End of findUser

    /**
     * This method is used to authenticate a user.
     *
     * @param username, String
     * @param password, String
     * @return User, the User object
     * @throws Exception, if the credentials are not valid
     */
    public User authenticate(String username, String password) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;

        String sql2 = "SELECT * FROM users_ex3_8130100_2021_2022 WHERE username=? AND password=?;";

        try {
            con = db.getConnection();
            stmt2 = con.prepareStatement(sql2);

            // Set parameters in the query
            stmt2.setString(1, username);
            stmt2.setString(2, password);

            rs = stmt2.executeQuery();

            if (!rs.next()) {
                throw new Exception("Wrong username or password");
            }

            User user = new User(
                    rs.getString("username"),
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("password")
            );

            rs.close();
            stmt2.close();
            db.close();

            return user;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    } //End of authenticate

    /**
     * Register/create new User.
     *
     * @param user, User
     * @throws Exception, if encounter any error.
     */
    public void register(User user) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt3 = null;
        ResultSet rs = null;

        String sqlCheckUser = "SELECT * FROM users_ex3_8130100_2021_2022 WHERE username=? AND email=?;";
        String sql3 = "INSERT INTO users_ex3_8130100_2021_2022 (username, firstname, lastname, email, password) " +
                "VALUES (?,?,?,?,?);";

        try {
            con = db.getConnection();
            stmt3 = con.prepareStatement(sqlCheckUser);

            //Set parameters in th query
            stmt3.setString(1, user.getUsername());
            stmt3.setString(2, user.getEmail());

            rs = stmt3.executeQuery();

            if (rs.next()) {
                rs.close();
                stmt3.close();
                throw new Exception("Sorry, username or email already registered");
            }

            stmt3 = con.prepareStatement(sql3);

            // Set parameters in the query
            stmt3.setString(1, user.getUsername());
            stmt3.setString(2, user.getFirstname());
            stmt3.setString(3, user.getLastname());
            stmt3.setString(4, user.getEmail());
            stmt3.setString(5, user.getPassword());

            stmt3.executeQuery();

            rs.close();
            stmt3.close();
            db.close();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception ignore) {

            }
        }
    }//end of register

} //End of class
