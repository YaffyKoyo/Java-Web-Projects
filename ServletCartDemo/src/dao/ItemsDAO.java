package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Items;
import util.DBHelper;

public class ItemsDAO {
	public ArrayList<Items> getAllItems() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<Items> list = new ArrayList<Items>();// items set
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setCity(rs.getString("city"));
				item.setName(rs.getString("name"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));

				list.add(item);// add one item to the set
			}
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// release data set object
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					// TODO Auto-generated catch block
					ex.printStackTrace();
				}
			}
			// release statement object
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					// TODO Auto-generated catch block
					ex.printStackTrace();
				}
			}
		}
	}

	public Items getItemsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBHelper.getConnection();
			String sql = "select * from items where id=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setCity(rs.getString("city"));
				item.setName(rs.getString("name"));
				item.setNumber(rs.getInt("number"));
				item.setPrice(rs.getInt("price"));
				item.setPicture(rs.getString("picture"));

				return item;
			} else {
				return null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// release data set object
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					// TODO Auto-generated catch block
					ex.printStackTrace();
				}
			}
			// release statement object
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					// TODO Auto-generated catch block
					ex.printStackTrace();
				}
			}
		}
	}
	
	//get recent 5 items viewed
	public ArrayList<Items> getViewList(String list)
	{
		System.out.println("list:"+list);
		ArrayList<Items> itemlist = new ArrayList<Items>();
		int iCount=5; //return 5 records eahc time
		if(list!=null&&list.length()>0)
		{
		    String[] arr = list.split(",");
		    System.out.println("arr.length="+arr.length);
		    //if records amount greater than 5
		    if(arr.length>=5)
		    {
		       for(int i=arr.length-1;i>=arr.length-iCount;i--)
		       {
		    	  itemlist.add(getItemsById(Integer.parseInt(arr[i])));  
		       }
		    }
		    else
		    {
		    	for(int i=arr.length-1;i>=0;i--)
		    	{
		    		itemlist.add(getItemsById(Integer.parseInt(arr[i])));
		    	}
		    }
		    return itemlist;
		}
		else
		{
			return null;
		}
		
	}

}
