package pam.setup;
import java.sql.*;

import java.util.ArrayList;
import util.conn.ConnectionUtils;
public class Item {
	public  ArrayList<ItemBean> getItemList()
	{
		ResultSet rs = null;
		ArrayList<ItemBean> list=new ArrayList<ItemBean>();
		
		try{
			
			
			Connection con = (Connection) ConnectionUtils.getConnection();
				Statement stmt=con.createStatement();  
				rs=stmt.executeQuery("select * from pos_item");
				
				while (rs.next()) {   
					ItemBean dbitem = new ItemBean();
					dbitem.setItemId(rs.getInt("itemId"));
					dbitem.setItemName(rs.getString("itemName"));
					dbitem.setItemCat(rs.getString("itemCat"));
					dbitem.setItemCostPrice(rs.getDouble("itemCost"));
					dbitem.setItemUnitPrice(rs.getDouble("itemPrice"));
					
					list.add(dbitem);
				}			
				con.close();
		}catch(Exception e){ System.out.println(e);}
		
		return list;
		
	}
}
