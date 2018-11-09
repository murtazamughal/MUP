package pam.setup;

import java.util.Arrays;  
import java.util.List;  


public class ItemBean {
	
	int item_id;
	String item_name;
	String item_description;
	String item_category;
	String[] fields = {"itemId", "itemName", "itemCat", "itemCostPrice", "itemUnitPrice"};
	
	
	double item_costprice;
	double item_unitprice;
	
	public void setItemId(int id){
		this.item_id=id;
		}  
	public int getItemId(){
		return item_id;
		}  
	  
	public void setItemName(String name){
		this.item_name=name;}  
	public String getItemName(){
		return item_name;
		} 
	public List<String> getFieldsList(){
		List<String> fieldsList =Arrays.asList(fields);  
		return fieldsList;
		} 
	
	
	public void setItemCat(String name){this.item_category=name;}  
	public String getItemCat(){return item_category;} 
	
	public void setItemCostPrice(double price){this.item_costprice=price;}  
	public double getItemCostPrice(){return item_costprice;} 
	
	public void setItemUnitPrice(double price){this.item_unitprice=price;}  
	public double getItemUnitPrice(){return item_unitprice;} 
	

}
