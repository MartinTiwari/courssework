package Extraction;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Products;

public class everyproduct {
    public List<Products> getAllProducts() {
        List<Products> products = new ArrayList<>();
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/martinwears", "root", "");

            // Create a SQL statement
            Statement stmt = conn.createStatement();

            // Execute the statement and retrieve the results
            ResultSet rs = stmt.executeQuery("SELECT * FROM products");

            // Loop through the results and create product objects
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                String productCategory = rs.getString("product_category");
                String productPrice = rs.getString("product_price");
                String productDescription = rs.getString("product_description");

                Products product = new Products(productId, productName, productImage, productCategory, productPrice, productDescription);
                products.add(product);
            }

            // Close the connection and statement
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    
    public Products getProductById(int productId) {
        Products product = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/martinwears", "root", "");

            // Create a SQL statement
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE product_id = ?");

            // Set the parameter values
            stmt.setInt(1, productId);

            // Execute the statement and retrieve the results
            ResultSet rs = stmt.executeQuery();

            // If a row was returned, create the product object
            if (rs.next()) {
                String productName = rs.getString("product_name");
                String productImage = rs.getString("product_image");
                String productCategory = rs.getString("product_category");
                String productPrice = rs.getString("product_price");
                String productDescription = rs.getString("product_description");

                product = new Products(productId, productName, productImage, productCategory, productPrice, productDescription);
            }

            // Close the connection, statement, and result set
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
}
