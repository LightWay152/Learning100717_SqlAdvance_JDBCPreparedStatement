package lab.JDBCPreparedStatement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCPreparedStatement {
	private static String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://localhost;Database=EShopV10;";
	private static String user="sa";
	private static String pass="123";
	
	public static void main(String[] args) {
		update();
		//query();
	}

	private static void query() {
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,user,pass);
			
			String sql = "SELECT * FROM Products WHERE UnitPrice>? AND YEAR(ProductDate) IN (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1,5.0);
			pstmt.setInt(2,2009);
			pstmt.setInt(3,2011);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				String name = rs.getString("Name");
				double price = rs.getDouble("UnitPrice");
				Date date = rs.getDate("ProductDate");
				
				System.out.println(">Name: "+name);
				System.out.println(">UnitPrice: "+price);
				System.out.println(">ProductDate: "+date);
				System.out.println();
			}
			
			conn.close();
			System.out.println("Query successfully!");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Query Faield!");
		}	
	}

	private static void update() { 
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,user,pass);
			
			String sql = "INSERT INTO Categories(Name,NameVN) VALUES(?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"Remote Control");
			pstmt.setString(2,"Điều khiển từ xa");
			pstmt.executeUpdate();
			
			conn.close();
			System.out.println("Insert successfully!");
		}catch(Exception e){
			System.out.println("Insert Faield!");
		}	
	}	
}
