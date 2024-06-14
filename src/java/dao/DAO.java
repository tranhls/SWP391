/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Customer;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buidu
 * @author LamHP
 */
public class DAO {

    Connection conn = null; //ket noi sql
    PreparedStatement ps = null; //nem cau lenh query qua sql
    ResultSet rs = null; //nhan ket qua tra ve

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Cart> listCart(int accountId) {
        List<Cart> list = new ArrayList<>();
        String query = "SELECT [cartID]\n"
                + "      ,c.productID as productID\n"
                + "      ,[totalAmount]\n"
                + "      ,accountID\n"
                + "      ,[totalQuantity],\n"
                + "	  p.name as pname,\n"
                + "	  p.price as pprice,\n"
                + "	  p.image as pimage\n"
                + "  FROM cart c JOIN product p ON c.productID = p.productID WHERE accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt("cartID"), rs.getInt("productID"), rs.getDouble("totalAmount"),
                        rs.getInt("totalQuantity"), new Product(rs.getInt("productID"), rs.getString("pname"), rs.getDouble("pprice"), rs.getString("pimage"))));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addToCart(int accountId, int quantity, int productId, double amount) {
        String query = "INSERT INTO [dbo].[cart]\n"
                + "           ([productID]\n"
                + "           ,[totalAmount]\n"
                + "           ,[accountID]\n"
                + "           ,[totalQuantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "		   ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setDouble(2, amount);
            ps.setInt(3, accountId);
            ps.setInt(4, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public void deleteCart(int cartId) {
        String query = "DELETE FROM [dbo].[cart]\n"
                + "      WHERE cartID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cartId);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public void updateToCart(int cartId, int quantity, double amount) {
        String query = "UPDATE [dbo].[cart]\n"
                + "   SET [totalAmount] = ?\n"
                + "      ,[totalQuantity] = ?\n"
                + " WHERE cartID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setDouble(1, amount);
            ps.setInt(2, quantity);
            ps.setInt(3, cartId);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public void order(int accountId, double amount) {
        String query = "INSERT INTO [dbo].[order]\n"
                + "           ([customerID]\n"
                + "           ,[orderDate]\n"
                + "           ,[totalAmount]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,GETDATE()\n"
                + "           ,?\n"
                + "           ,'Completed')";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            ps.setDouble(2, amount);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public Cart checkCartExist(int accountId, int productId) {
        String query = "SELECT  [cartID]\n"
                + "      ,[productID]\n"
                + "      ,[totalAmount]\n"
                + "      ,[accountID]\n"
                + "      ,[totalQuantity]\n"
                + "  FROM [cart] WHERE accountID = ? AND productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountId);
            ps.setInt(2, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getInt(5),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getTopProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select top 3 * from product\n"
                + "order by price desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop1Product() {
        List<Product> list = new ArrayList<>();
        String query = "select top 1 * from product\n"
                + "order by price desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCatID(int catID) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where catID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, catID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductBySellID(int sellID) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where SellID= ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sellID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(int id) {
        String query = "select * from product\n"
                + "where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProductByName(String name) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account getAccount(String user, String pass) {
        String query = "select * from account\n"
                + "where [user] = ? and pass = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccExist(String user) {
        String query = "select * from account\n"
                + "where [user] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String user, String pass) throws Exception {
        String query = "INSERT INTO account([user], pass, isAdmin, isSeller) VALUES (?, ?, 0, 0);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            e.printStackTrace();
        }
    }

    public void updateAcc(int id, String user, String pass) {
        String query = "UPDATE account\n"
                + "SET [user] = ?, pass = ?\n"
                + "WHERE accountID = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public void updateCus(int id, String name, String email, String phone, String address) {
        String query = "UPDATE customer\n"
                + "SET [name] = ?, email = ?, phone = ?, [address] = ?\n"
                + "WHERE accountID = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return;
        }
    }

    public void signUpUser(String name, String email, String phone, String address) throws Exception {
        String customerQuery = "INSERT INTO customer(name, email, phone, address) VALUES (?, ?, ?, ?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(customerQuery);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address); // Sửa "position" thành "address"
            ps.executeUpdate();
        } catch (Exception e) {
            // Xử lý exception
            e.printStackTrace();
        }
    }

    public Customer getCustomerByID(int id) {
        String query = "select * from customer\n"
                + "where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getAccountByID(int id) {
        String query = "select * from account\n"
                + "where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addProduct(Product product) {
        String query = "INSERT INTO product(name, description, price, image, catID) VALUES (?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getCatID());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteProductId(String pid) {
        String query = "delete from product \n"
                + "where productID =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String description,
            String price, String category, String image, String catID, int sellID) {
        String query = "INSERT [dbo].[product] \n"
                + "([name], [description], [price], [category], [image], [catID],[SellID])\n"
                + "VALUES(?,?,?,?,?,?,?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, category);
            ps.setString(5, image);
            ps.setString(6, catID);
            ps.setInt(7, sellID);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public static void main(String[] args) {
        //Product p = new Product( "Cứt", "haha", 1000, "cafe", "https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg", 3, 1);
        DAO d = new DAO();
        //d.insertProduct("Cứt", "haha", "1000", "cafe", "https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg", "3", 1);
        List<Cart> c = d.listCart(3);
        for (Cart cart : c) {
            System.out.println(cart);
        }
    }

      public void editProduct(String name, String description, String price, String image, String catID, String category, String productID) {
        String query = "update product\n"
                + "set [name] =?,\n"
                + "[description]=?,\n"
                + "price=?,\n"
                + "[image]=?,\n"
                + "catID =?,\n"
                + "category =?\n"
                + "where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, image);
            ps.setString(5, catID);
            ps.setString(6, category);
            ps.setString(7, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean updatePassword(String email, String pass) {
        String query = "UPDATE account SET pass = ? FROM account JOIN customer ON account.accountID = customer.accountID WHERE email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setString(2, email);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            // Xử lý exception, có thể log hoặc throw ra ngoài để báo lỗi
            return false;
        }
    }
}
