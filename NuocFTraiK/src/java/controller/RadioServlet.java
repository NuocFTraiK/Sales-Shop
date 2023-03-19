/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author dell
 */
@WebServlet(name="RadioServlet", urlPatterns={"/radio"})
public class RadioServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RadioServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RadioServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String[] id_raw = request.getParameterValues("id");
        int[] id = null;
        if (id_raw != null) {
            id = new int[id_raw.length];
            for (int i = 0; i < id.length; i++) {
                id[i] = Integer.parseInt(id_raw[i]);
            }
        }
        String sortname = request.getParameter("sortname");
        DAO d = new DAO();
        List<Product> listP = d.radio(sortname);
       
        request.setAttribute("listP", listP);
        List<Category> listC = d.getAllCategory();
        boolean[] cid = new boolean[listC.size()];
        for (int i = 0; i < cid.length; i++) {
            if (isCheck(listC.get(i).getCategoryId(), id)) {
                cid[i] = true;
            } else {
                cid[i] = false;
            }
        }
        request.setAttribute("sortname", sortname);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("checkbox.jsp").forward(request, response);

    } 
    
     private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
        }
     }
    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String[] id_raw = request.getParameterValues("id");
        int[] id = null;
        if (id_raw != null) {
            id = new int[id_raw.length];
            for (int i = 0; i < id.length; i++) {
                id[i] = Integer.parseInt(id_raw[i]);
            }
        }
        String sortprice = request.getParameter("sortprice");
        DAO d = new DAO();
        List<Product> listP = d.radioPrice(sortprice);
       
        request.setAttribute("listP", listP);
        List<Category> listC = d.getAllCategory();
        boolean[] cid = new boolean[listC.size()];
        for (int i = 0; i < cid.length; i++) {
            if (isCheck(listC.get(i).getCategoryId(), id)) {
                cid[i] = true;
            } else {
                cid[i] = false;
            }
        }
        
        request.setAttribute("sortprice", sortprice);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("checkbox.jsp").forward(request, response);

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
