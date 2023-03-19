/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Admin;
import model.Cart;
import model.Category;
import model.Customer;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author dell
 */
public class DAO extends DBContext {

//    Connection conn = null;    //connect den sql serve
//    PreparedStatement ps = null;  //Nem cau lenh qua sql serve
//    ResultSet rs = null;         //Nhan ket qua tra ve
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();

        String sql = "select * from Product where 1 = 1";
        if (categoryId != 0) {
            sql += "and categoryId = " + categoryId;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getSameProductsByCategoryId(int id, int categoryId) {
        List<Product> list = new ArrayList<>();

        String sql = "SELECT top(4) * from  Product WHERE ProductId != ? AND CategoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int id) {

        String sql = "select * from Product where productId=" + id;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> searchProductByName(String txt) {
        String sql = "select * from Product where [name] like N'%" + txt + "%'";
        List<Product> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Admin check(String user, String pass) {
        String sql = "select * from Admin where [user] = '" + user + "' and password = '" + pass + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString(1), rs.getString(2), rs.getInt(3));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Admin checkAccountExist(String user) {
        String sql = "select * from Admin where [user] = '" + user + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString(1), rs.getString(2), rs.getInt(3));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Insert Tai Khoan Dang Ki
    public void signup(String user, String pass, String name) {
        String sql = "Insert into [Admin] values(?,?,0) ";
        String sql1 = " INSERT INTO [dbo].[Customer]([User],CustomerName) VALUES(?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st.setString(1, user);
            st.setString(2, pass);
            st.executeUpdate();
            st1.setString(1, user);
            st1.setString(2, name);
            st1.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProfile(String name, String email, String phone, String address, String user) {

        String sql = "UPDATE [dbo].[Customer] SET [CustomerName] = ? ,[Email] = ?,[Phone] = ?,[Address] = ? WHERE [User] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.setString(5, user);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void changePassword(String newpass, String user) {

        String sql = "UPDATE [dbo].[Admin] SET [Password] = ? WHERE [User] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, user);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> checkbox(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where 1=1";
        if (cid != null) {
            sql += " and categoryId in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += ")";
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> radio(String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by [Name] " + sort;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> radioPrice(String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by [Price] " + sort;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchPrice(Double price1, Double price2) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where 1=1 ";

        if (price1 != 0) {
            sql += " and price>=" + price1;
        }
        if (price2 != 0) {
            sql += " and price<=" + price2;
        }
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4),
                        rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertProduct(int id, String name, String describe,
            double price, String image,
            int categoryId, String origin,
            int status) {
        String sql = "INSERT [dbo].[Product] (ProductId ,[Name],Describe ,Price ,[Image] ,CategoryId,Origin,[Status]) VALUES  (?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, name);
            st.setString(3, describe);
            st.setDouble(4, price);
            st.setString(5, image);
            st.setInt(6, categoryId);
            st.setString(7, origin);
            st.setInt(8, status);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    //Delete a category
    public void delete(int id) {
        String sql = "delete from Product where ProductId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Update a category
    public void update(Product p) {
        String sql = "UPDATE [dbo].[Product] SET [Name] = ? ,[Describe] = ? ,[Price] =?,[Image] =?  ,[CategoryId] = ?,[Origin] = ? ,[Status] =? WHERE  ProductId =?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, p.getName());
            st.setString(2, p.getDescribe());
            st.setDouble(3, p.getPrice());
            st.setString(4, p.getImage());
            st.setInt(5, p.getCategoryId());
            st.setString(6, p.getOrigin());
            st.setInt(7, p.getStatus());
            st.setInt(8, p.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//     CART
    public Customer getAccount(String user) {
        String sql = "select * from customer where [user]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addOrder(Customer c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            String sql = "insert into [Order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, c.getId());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
            //cap nhat lai so luong san pham
            String sql3 = "update product set status = status -? where ProductId=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {

        }
    }
    
     public List<Order> getAllOrderByCusId(int cusid) {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from [Order] where Cusid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cusid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
     
      public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "Select * from [Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
      
       public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        String sql = "Select * from [Customer]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    

//END CART
    public static void main(String[] args) {
        DAO dao = new DAO();

    }
}
