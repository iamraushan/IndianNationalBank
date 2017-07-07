package bean;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

//import javax.servlet.http.Cookie;

public class LoginCheck 
{
	
	public LoginCheck() {
		// TODO Auto-generated constructor stub
	}
		
	public String getData(String id,int op)
	{
		Connection conn = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="select * from client where c_id='"+id+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			
				if (rs.absolute(1))//for given specific row
				{
					
					String s=rs.getString(op);
					
						if(conn!=null)
						{
							conn.close();
							Thread.sleep(1000);
						}
					
					 
					return s;//returns the number of column
				}
				else
				{
					System.out.print("Failed from getdata");
				}
				
				
			       
			     
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		return null;
		
		
		
		
	}
	public String getAccDetails(String id,int op,int r)//fix that 
	{//this is method to get account details accouding to the customer
		//id is the customer id fetched ;op is for column number;r is for row number 
		//r is neccessary if a customer has multiple accounts
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="select * from accounts where acc_no=(select acc_no from rdca where c_id='"+id+"')";
			ResultSet rs = stmt.executeQuery(query);
			
			
				if (rs.absolute(1))
				{
					
					String s=rs.getString(op);
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					
					return s;//returns the number of column
				}
				else
				{
					System.out.print("Account doesn't exists");
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					return null;
				}
				
			    
			    
			}
			catch(Exception e)
			{
				System.out.println("Exception from getAccDeatails");
				System.out.println("Tomcat server stopped working");
				System.out.println(e);
			}
		return null;
	}
	
	public boolean isEliglible(String acc,String money)
	{
		
    	
		if(acc!=null)
		{
			try 
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				String query="select * from accounts where acc_no='"+acc+"'";
				//String query2="select * from accounts where acc_no='"+toacc+"'";
				ResultSet rs = stmt.executeQuery(query);
				//ResultSet rs2 = stmt.executeQuery(query2);
				Float mon=Float.valueOf(money);
				
				//if(rs2.next()){
				if(rs.next())
				{
					if(Float.valueOf(rs.getString(2)) >= mon)
					{
						if(conn!=null)
						{
							conn.close();
							Thread.sleep(1000);
						}
						return true;
					}
					else
					{
						if(conn!=null)
						{
							conn.close();
							Thread.sleep(1000);
						}
						return false;
					}
				}
				else
				{
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					return false;
				}
				/*}
				else
				{
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					
					return false;
				}*/
		    
			} 
			catch (Exception e)
			{
			// TODO Auto-generated catch block
				System.out.println("Exception from isEligible");
				System.out.println(e);
			}
		}
		else
		{
			return false;
		}
			return false;
	 }
	public boolean isExist(String acc)
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="select * from accounts where acc_no='"+acc+"'";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
				return true;
			}
			else
			{
				if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
				return false;
			}
		
			
		}
		catch(Exception e)
		{
			System.out.println("Exception from isExist()");
			System.out.println(e);
		}
		return false;
	}
	
	
	
	
	
	public String accounts(String acc,int op)//fix that 
	{
		//this method is to get account details w.r.t account number of the customer like amount and all
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String query="select * from accounts where acc_no='"+acc+"'";
		    ResultSet rs = stmt.executeQuery(query);
		    if(rs.next())
		    {
		    	String data;
		    	data = rs.getString(op);
		    	if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
		    	return data;
		    }
		    else
		    {
		    	return null;
		    }
		    
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			System.out.println("Exception from accounts");
			System.out.println(e);
		}
		return null;
	}
	public boolean updateAccounts(String accno,float money)
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String query="update accounts set balc='"+money+"' where acc_no='"+accno+"'";
		    int rs = stmt.executeUpdate(query);
		    if(rs!=0)
		    {
		    	if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
		    	return true;
		    }
		    else
		    {
		    	return false;
		    }
		    
			
		}
		catch(Exception e)
		{
			System.out.println("Exception from updateAccounts");
			System.out.println(e);
		}
		return false;
	}
	public boolean setTransaction(String facc, String tacc ,float money,float f_balnc,float t_balnc)
	{
		try
		{
			int tid;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String pre ="select * from transaction order by t_id";
		    ResultSet r1= stmt.executeQuery(pre);
		    if(r1.last())
		    {
		    	tid= Integer.valueOf(r1.getString(1));
		    	++tid;
		    }
		    else
		    {
		    	tid=654321;
		    }
		    LocalDate localDate = LocalDate.now();
	        String tdate=DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate);
	        String remarks="Amount wired from "+facc+" to "+tacc;
	        if( (Integer.parseInt(tacc)>=700000000 && Integer.parseInt(tacc)<=900000000) || (Integer.parseInt(facc)>=700000000 && Integer.parseInt(facc)<=900000000))
	        {
	        	remarks  = "FD";
	        }
	        
		    String query="insert into transaction values('"+tid+"','"+tdate+"','"+facc+"','"+tacc+"','"+money+"','"+remarks+"','"+f_balnc+"','"+t_balnc+"')";
	     
		    System.out.println(query);
		    int rs = stmt.executeUpdate(query);
		    if(rs==1)
		    {
		    	if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
		    		return true;
		    }
		    else
		    {
		    	if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
		    	return false;
		    }
		    
		}
		catch(Exception e)
		{
			System.out.println("Exception from setTransaction");
			System.out.println(e);
		}
		
		
		
		return false;
	}
	public String isCompany(String cacc)
	{
		try
		{
			int acc = Integer.valueOf(cacc);
			if(acc>1000001010)
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				String query="select c_f_name from client where c_id = (select c_id from rdca where acc_no ="+cacc+" and c_id<1234 )";
				ResultSet rs= stmt.executeQuery(query);
				if(rs.next())
				{
					String cname = rs.getString("c_f_name");
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					System.out.println(cname);
					return cname;
				}
				else
				{
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					return null;
				}
			}
			else
			{
				
				return null;
			}
			
			
		}
		catch(Exception e)
		{
			System.out.println("Exception from isCompany");
			System.out.println(e);
		}
		
		
		return null;
		
	}
	
	public boolean updateClient(String col, String data,String uid)
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="update client set "+col+" ='"+data+"' where c_id="+uid+"";
			int rs = stmt.executeUpdate(query);
			if(rs==1)
			{
				if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
				return true;
			}
			else
			{
				if(conn!=null)
				{
					conn.close();
					Thread.sleep(1000);
				}
				return false;
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception from updateClient");
			System.out.println(e);
		}
		return false;
		
	}
	public int createFDAccount(String balance,String acctype, String matDate, String branch, int cid) 
	{
		
		try
		{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			int acc=700000000;
			String q1 = "select acc_no from fd order by acc_no";//that worked on Oracle 10g [tested]
			ResultSet rs1 = stmt.executeQuery(q1);//executing query
			if(rs1.last()) //checking whether row has some value or not
			{
				System.out.println("Bullock 1 is implementing");
				String s = rs1.getString(1);
				System.out.println(s);
				acc = Integer.parseInt(s);
				++acc;
			}	
			System.out.println(acc);
			String query0="select * from rdca where c_id='"+cid+"'";
			ResultSet rs0 = stmt.executeQuery(query0);
			String fda=null;
			if(rs0.next())
			{
				fda =rs0.getString(3);
			}
			if(fda!=null)
			{
			LocalDate localDate = LocalDate.now();//intialisong localdate objexct from localdate class
	        String currdate=DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate);//getting current date
	        String query="insert into fd values('"+acc+"','"+balance+"','"+currdate+"','"+acctype+"','"+matDate+"','"+currdate+"','"+branch+"')";
			int rs = stmt.executeUpdate(query);
			if(rs == 1)
			{
				System.out.println("Account table successfully updated");
				String q4 = "update rdca set fd ='"+acc+"' where c_id='"+cid+"'" ;
				
				int rs2 = stmt.executeUpdate(q4);
				if( rs2== 1)
				{
					System.out.println("RDCA table successflly updated"); 
					if(conn!=null)
					{
						conn.close();
						Thread.sleep(1000);
					}
					return acc;
					
					
				}
				
			}
			}
			else
			{
				return 0;
			}
			
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
			System.out.println("Exception from createAccount");
		}
		
		
		return 0;
		
	}
	
	
	public String getAdminData(String id,int op)
	{
		Connection conn = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="select * from admin where a_id='"+id+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			
				if (rs.absolute(1))//for given specific row
				{
					
					String s=rs.getString(op);
					
						if(conn!=null)
						{
							conn.close();
							Thread.sleep(1000);
						}
					
					 
					return s;//returns the number of column
				}
				else
				{
					System.out.print("Failed from getdata");
				}
				
				
			       
			     
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		return null;
		
		
		
		
	}
	
	
	
	
	
}
	
	

