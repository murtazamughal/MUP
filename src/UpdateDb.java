import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.conn.ConnectionUtils;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class UpdateDb
 */

public class UpdateDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/jsp");
		PrintWriter out = response.getWriter();
		
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		String itemName =request.getParameter("itemName");
		String itemCat =request.getParameter("itemCat");
		Double itemCost = Double.valueOf(request.getParameter("itemCost"));
		Double itemPrice =Double.valueOf(request.getParameter("itemPrice"));
		try {
			Connection con = (Connection) ConnectionUtils.getConnection();
			PreparedStatement ps =(PreparedStatement) con.prepareStatement("insert into pos_item(itemId, itemName, itemCat, itemCost,itemPrice) values(?,?,?,?,?)");
			ps.setInt(1,itemId);
			ps.setString(2,itemName);
			ps.setString(3,itemCat);
			ps.setDouble(4,itemCost);
			ps.setDouble(5,itemPrice);

				
			int i=ps.executeUpdate();
			if(i>0)
			out.print("You are successfully registered...");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.close();
	}
	

}
