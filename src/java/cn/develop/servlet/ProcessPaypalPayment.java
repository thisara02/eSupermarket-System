/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cn.develop.servlet;

import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author asust
 */
@WebServlet(name = "ProcessPaypalPayment", urlPatterns = {"/processPayPalPayment"})
public class ProcessPaypalPayment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String clientId = "AS3T7t0N_xWqwsj0qIDZlCSVOcGoa1ir4JDPGyYzwiXFpoOUxE1CMIJqS6zydfkSnTg5T4z1vdXapHPm";
        String clientSecret = "ECfZEEYwlyOzUnl00qWN525EIciLFbXjgAqUJ6U_kCSaO7SxmbHWIZHkFP4nADmG2ZHHCaNnhyLh1hKh";

        APIContext apiContext = new APIContext(clientId, clientSecret, "sandbox");

        // Get amount from the form submission
        String amount = request.getParameter("amount");

        // Create a Payment object and set up the transaction details
        Amount transactionAmount = new Amount();
        transactionAmount.setCurrency("USD");
        transactionAmount.setTotal(amount);

        Transaction transaction = new Transaction();
        transaction.setDescription("Payment for your product or service");
        transaction.setAmount(transactionAmount);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);

        // Redirect URLs for PayPal to redirect the user after the payment
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setReturnUrl("index.jsp");
        redirectUrls.setCancelUrl("billing.jsp");
        payment.setRedirectUrls(redirectUrls);

        // Create the payment
        try {
            Payment createdPayment = payment.create(apiContext);

            // Get the approval URL
            String approvalURL = createdPayment.getLinks().get(1).getHref();

            // Redirect the user to PayPal for approval
            response.sendRedirect(approvalURL);
        } catch (PayPalRESTException e) {
// Handle exception (log it or display an error message)
                        response.getWriter().write("Error processing PayPal payment.");
        }
        
        String userEmail = request.getParameter("userEmail");

        
        if (userEmail != null && !userEmail.isEmpty()) {
            
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            final String username = "greensupermarket56@gmail.com";
            final String password = "numehmifeaqalesb";

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
               
                MimeMessage message = new MimeMessage(session);

                message.setFrom(new InternetAddress(username));

                message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

                message.setSubject("Payment Confirmation");

                message.setText("Thank you for your payment. Your order is confirmed.");

                Transport.send(message);
            } catch (MessagingException e) {
      
            }
        }
    }
        
}


