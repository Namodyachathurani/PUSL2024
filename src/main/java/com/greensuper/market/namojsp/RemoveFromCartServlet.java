package com.greensuper.market.namojsp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemIdToRemove = request.getParameter("itemId");

        // Get or create the user's session
        HttpSession session = request.getSession(true);

        // Get the cart from the session or create a new one
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            // Remove the item from the cart
            cart.removeItem(itemIdToRemove);
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}

