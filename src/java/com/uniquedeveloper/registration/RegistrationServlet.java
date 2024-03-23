
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;


/**
 *
 * @author asust
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/Register"})
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
        
                 String uname=request.getParameter("name");
                 String uemail=request.getParameter("email");
                 String upwd=request.getParameter("pass");
                 String umobile=request.getParameter("contact");
                 RequestDispatcher dispatcher = null;
                 Connection con=null;
                 
                 try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/esupermarket", "admin", "8645");
                 PreparedStatement pst = con.prepareStatement("insert into user(uname,upwd,uemail,umobile) values(?,?,?,?)");
                 {
                 pst.setString(1,uname);
                 pst.setString(2,upwd);
                 pst.setString(3,uemail);
                 pst.setString(4,umobile);
                 
                 int rowCount = pst.executeUpdate();
                 
                 String userEmail=request.getParameter("uemail");
                 sendRegistrationEmail(userEmail);
                 
                 dispatcher=request.getRequestDispatcher("registration.jsp");
                 if(rowCount>0){
                     request.setAttribute("status","success");    
                 }else{
                     request.setAttribute("status","failed");
                 }
                 
                 dispatcher.forward(request,response);}
                 }catch (SQLException | ClassNotFoundException e) {
                     // Handle the exception more gracefully, log it, or send a meaningful response to the user.
         }finally{}

        // Set status attribute for successful registration
        request.setAttribute("status", "success");
        // Forward the request to the registration.jsp
        RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
        rd.forward(request, response);
        
    }

    private void sendRegistrationEmail(String userEmail) {
         if (userEmail != null && !userEmail.isEmpty()) {
        final String username = "greensupermarket56@gmail.com";
        final String password = "supermarket81455682";

        try {
            // Create the email
            HtmlEmail email = new HtmlEmail();
            email.setHostName("smtp.gmail.com");
            email.setSmtpPort(587);
            email.setAuthenticator(new DefaultAuthenticator(username, password));
            email.setStartTLSEnabled(true);
            email.setFrom(username, "greensupermarket56@gmail.com");
            email.addTo(userEmail, "Recipient Name");
            email.setSubject("Registration Successful");

            // Set HTML content
            String htmlContent = "Dear User,<br><br>"
                    + "Thank you for registering with GREEN Supermarket. "
                    + "Your registration was successful. Welcome to our community!";
            email.setHtmlMsg(htmlContent);

            // Send the email
            email.send();

            System.out.println("Email sent successfully!");
        } catch (EmailException e) { // Log the exception
            // Log the exception
            System.out.println("Email sending failed: " + e.getMessage());
        }
    } else {
        // Handle the case where userEmail is null or empty
        System.out.println("Email address is null or empty");
    }
}
}
