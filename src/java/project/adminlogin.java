package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "adminlogin", urlPatterns = {"/adminlogin"})
public class adminlogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>OES</title>");            
            out.println("</head>");
            
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            String driverName="com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/online_exam";
            String dbuser = "root";
            String dbpass = "";
            String sql = "select * from adminlog where email=? and password=?";
            
            String id = "";
            String emailid = "";
            
            try{
                if(email!=null){
                    
                    Class.forName(driverName);
                    conn=DriverManager.getConnection(url, dbuser, dbpass);
                    ps=conn.prepareStatement(sql);
                    ps.setString(1, email);
                    ps.setString(2, pass);
                    
                    rs=ps.executeQuery();
                    
                    if(rs.next()){
                        String adminEmail = rs.getString("email");
                        HttpSession hs = request.getSession();
                        hs.setAttribute("id", "admin");
                        hs.setAttribute("name", "Admin");
                        hs.setAttribute("email", adminEmail);
                        RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
                        rd.forward(request, response);
                    }
                    else{
                        HttpSession hs = request.getSession();
                        RequestDispatcher d = request.getRequestDispatcher("adminlogin.jsp");
                        hs.setAttribute("err", "User Credentials Incorrect");
                        d.forward(request,response);
                        rs.close();
                        ps.close();
                    }
                }
                
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
        }
            catch(Exception e){
                
            }
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
