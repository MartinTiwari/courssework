package controller.servlets.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Resources.MyCipher;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        RequestDispatcher dispatcher = null;

        String usemail = request.getParameter("email");
        String uspass = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/martinwears";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(url, user, pass);

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM registration WHERE usemail = ?");
            stmt.setString(1, usemail);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Decrypt the password
                String decryptedPassword = MyCipher.decrypt(rs.getString("uspass"), "meronamemartinho");

                if (uspass.equals(decryptedPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", rs.getString("usemail"));
                    session.setAttribute("name", rs.getString("usname")); // set the name attribute

                    Cookie cookiee = new Cookie("name", rs.getString("usname"));
                    cookiee.setMaxAge(4800);
                    response.addCookie(cookiee);

                    dispatcher = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("errorMessage", "Incorrect email or password");
                    dispatcher = request.getRequestDispatcher("Form.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Incorrect email or password");
                dispatcher = request.getRequestDispatcher("Form.jsp");
            }

            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}
