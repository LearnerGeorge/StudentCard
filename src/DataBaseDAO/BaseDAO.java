package DataBaseDAO;
import java.sql.*;
public class BaseDAO {
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	public BaseDAO()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/studentcard";// ����url�ַ���
			String user = "root";// ���ݿ��û���
			String password = "";// ���ݿ�����
			this.conn=DriverManager.getConnection(url,user,password);
			this.st=this.conn.createStatement();
			this.rs=null;

		}catch(Exception ex)
		{ex.printStackTrace();
		}
		
	}
	
	public String doUpgrade(String sql)
	{
		try{
			if(this.st!=null)
		this.st.executeUpdate(sql);
		return "";
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return ex.getMessage();
		}
		
	}
	
	
	
	public ResultSet doQuery(String sql)
	{
		try{
			this.rs=this.st.executeQuery(sql);
			
			}catch(Exception ex)
			{
				ex.printStackTrace();
				
			}
			return this.rs;
			
	}
	
	public void close()
	{
		try{
			if(!this.rs.wasNull())
			{
				this.rs.close();
				this.rs=null;
			}
			
			if(!this.st.isClosed())
			{
				this.st.close();
				this.st=null;
			}
			
			if(!this.conn.isClosed())
			{
				this.conn.close();
				this.conn=null;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}















