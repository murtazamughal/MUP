package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pam.setup.*;
import com.google.gson.Gson;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/product")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
	
		
		try {
		Gson gson = new Gson();
		Item item = new Item();
		
		if(action.equalsIgnoreCase("productlist")) {
			String	data = "{\r\n"
					+ "\"Result\":\"OK\"," + 
					"\"Records\":"+
					gson.toJson(item.getItemList()) +
					"}";
					
			//out.print(gson.toJson(item.getItemList()));
			out.print(data);
			
			out.flush();
			out.close();
		}else
		{
			
		}
		} catch(Exception e) {
	         //Handle errors for Class.forName
	         e.printStackTrace();
	      } 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
