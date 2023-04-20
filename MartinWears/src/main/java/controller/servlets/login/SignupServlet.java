package controller.servlets.login;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Resources.MyCipher;


@WebServlet("/register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class SignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String UPLOAD_DIR = "RegisteredUser";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Encrypt the password
        String encryptedPassword = null;
        try {
            encryptedPassword = MyCipher.encrypt(password, "meronamemartinho");
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        Part part = request.getPart("image");
        String fileName = extractFileName(part);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }

        String savePath = "http://localhost:8082" + request.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;
        System.out.println("savePath: " + savePath);

        Path filePath = Paths.get(uploadPath + File.separator + fileName);
        Files.deleteIfExists(filePath);

        // Create a file object for the destination file
        File destFile = new File("C:\\Users\\Asus\\eclipse-workspace\\MartinWears\\src\\main\\webapp\\Image\\RegisteredUser\\" + fileName);

        try (InputStream input = part.getInputStream();
             OutputStream output = new FileOutputStream(destFile)) {

            // Write the input stream to the output stream with a buffer of 4KB
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        dbFileName = UPLOAD_DIR + File.separator + fileName;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/martinwears", "root", "");
            PreparedStatement pst = con.prepareStatement(
                    "insert into registration (usname, usemail, uspass, imagename, imagepath) values(?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, encryptedPassword);
            pst.setString(4, dbFileName);
            pst.setString(5, savePath);
            pst.executeUpdate();
            out.println("<center><h1>Registration Successful!</h1></center>");

        } catch (Exception e) {
            out.println(e);
        }

    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
