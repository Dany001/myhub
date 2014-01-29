


import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CheckAvailability extends HttpServlet {

	private static final long serialVersionUID = -734503860925086969L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String connectionURL = "jdbc:mysql://localhost:3306/test"; // students is my database name
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "root", "");
            String uname = request.getParameter("uname");
            PreparedStatement ps = connection.prepareStatement("select uname from users where uname=?");
            ps.setString(1,uname);
            ResultSet rs = ps.executeQuery();
             
            if (!rs.next()) {
                out.println("<font color=green><b>"+uname+"</b> is avaliable");
            }
            else{
            out.println("<font color=red><b>"+uname+"</b> is already in use</font>");
            }
            out.println();



        } catch (Exception ex) {

            out.println("Error ->" + ex.getMessage());

        } finally {
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
