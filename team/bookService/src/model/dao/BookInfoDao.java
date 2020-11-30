package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.bookInfo;
import model.rentalBook;
import model.rentalInfo;
import model.dao.rentalbookDAO;

public class BookInfoDao {
	
	private JDBCUtil jdbcUtil = null;

	   
	   public BookInfoDao() {         
	      jdbcUtil = new JDBCUtil();   // JDBCUtil ��ü ����
	   }
	   
	   //book ���� �߰� �Լ� -> �밭 ���� ���̴� ���߿� �������ּ���!
	   public int addBook(bookInfo book) throws SQLException{
	      String query = "Insert into bookInfo(bookinfoID, bookname, writer, publisher, category, bookimage, rentalCnt) values(?,?,?,?,?,?,?)";
	      Object[] param = new Object[] {book.getBookinfoID(),  book.getBookname(), book.getWriter(), book.getPublisher(), book.getCategory(), book.getBookimage(), book.getRentalCnt()};
	      jdbcUtil.setSqlAndParameters(query, param);
	      System.out.println(query + param);
	      
	      try {
	         int result = jdbcUtil.executeUpdate();
	         return result;
	      } catch (Exception ex) {
	         jdbcUtil.rollback();
	         ex.printStackTrace();
	      } finally {      
	         jdbcUtil.commit();
	         jdbcUtil.close();   // resource ��ȯ
	      }      
	      return 0;
	   }
	   
	   //bookimage, rentalCnt ���� -> �ϴ� ��������
	   public int update(bookInfo book) throws SQLException {
	      String query = "update bookinfo set bookimage=?, rentalCnt=?"
	                  + "where bookinfoID=?";
	      
	      Object[] param = new Object[] {book.getBookimage(), book.getRentalCnt()};
	      jdbcUtil.setSqlAndParameters(query, param);
	      
	      try {            
	         int result = jdbcUtil.executeUpdate();   // update �� ����
	         return result;
	      } catch (Exception ex) {
	         jdbcUtil.rollback();
	         ex.printStackTrace();
	      }
	      finally {
	         jdbcUtil.commit();
	         jdbcUtil.close();   // resource ��ȯ
	      }      
	      
	      return 0;
	      
	   }

	   /*���� �������� ���� ���� ���  _ �뿩���ִ� å ����Ʈ ����, �뿩 ���� å  ����Ʈ ����  ���� ���� ���� ��������.*/
	   public bookInfo findBookInfo(String bookinfoID) throws SQLException { /* memberId String Ÿ������ ���� �����ϱ�!!!!!!!!*/
		   
	      String query = "select bookinfoID, bookname, writer, publisher, category, bookimage, rentalCnt "
	               + "from bookInfo "
	               + "where bookinfoID = ?";
	      
	      jdbcUtil.setSqlAndParameters(query, new Object[] {bookinfoID});
	      
	      
	      try {  	  
	    	  ResultSet rs = jdbcUtil.executeQuery();      // query ����
	    	  
	    	  if (rs.next()) {                  // �л� ���� �߰�
	    		  
	    		  bookInfo book = new bookInfo(      // User ��ü�� �����Ͽ� �л� ������ ����
	    				  bookinfoID,
	    				  rs.getString("bookname"),
	    				  rs.getString("writer"),
	    				  rs.getString("publisher"),
	    				  rs.getString("category"),
	    				  rs.getString("bookimage"),
	    				  rs.getInt("rentalCnt"));
	    		  
	    		  return book;
	    	  	}
	    	  
	      	} catch (Exception ex) {
	      		ex.printStackTrace();
	      	} finally {
	      		jdbcUtil.close();      // resource ��ȯ
	      	}
	      
	      return null;
	      
	   }
	   
	   public int remove(String bookinfoID) throws SQLException {
	         String sql = "DELETE FROM BOOKINFO WHERE bookinfoID = ?";      
	           jdbcUtil.setSqlAndParameters(sql, new Object[] {bookinfoID});   // JDBCUtil�� delete���� �Ű� ���� ����
	           
	            try {            
	               int result = jdbcUtil.executeUpdate();   // delete �� ����
	               return result;
	            } catch (Exception ex) {
	               jdbcUtil.rollback();
	               ex.printStackTrace();
	            }
	            finally {
	               jdbcUtil.commit();
	               jdbcUtil.close();   // resource ��ȯ
	            }      
	            return 0;
	         
	      }
	   
	   //�������� �˻��ϱ�!
	   public List<bookInfo> getSearchBookList(String text, String stype) throws SQLException {
		   String query = "select bookinfoID, bookname, writer, publisher, category, bookimage, rentalCnt "
	               + "from bookInfo ";
		   text = '%' + text + '%';
		   
		   if (stype.equals("all"))
		   {
			   query += "where writer like ? or bookname like ? ";
			   jdbcUtil.setSqlAndParameters(query, new Object[] {text, text});
		   }
		   else if (stype.equals("subject"))
		   {
			   query += "where bookname like ?";
			   jdbcUtil.setSqlAndParameters(query, new Object[] {text});
		   }
		   else
		   {
			   query += "where writer like ?";
			   jdbcUtil.setSqlAndParameters(query, new Object[] {text});
		   }
		   
		   try {
			   ResultSet rs = jdbcUtil.executeQuery();
			   List<bookInfo> mSearchBookList = new ArrayList<bookInfo>();
			   
			   while(rs.next()) {
				   bookInfo book = new bookInfo();
				   
				   book.setBookinfoID(rs.getString("bookinfoID"));
				   book.setBookname(rs.getString("bookname"));
				   book.setWriter(rs.getString("writer"));
				   book.setPublisher(rs.getString("publisher"));
				   book.setCategory(rs.getString("category"));
				   book.setBookimage(rs.getString("bookimage"));
				   book.setRentalCnt(rs.getInt("rentalCnt"));
				   
				   mSearchBookList.add(book);
			   }
			   
			   return mSearchBookList;
		   	}catch(Exception ex) {}
	       
	       return null;
	   }
	    
		public boolean existingBook(String memberID) {
			String sql = "SELECT count(*) FROM bookInfo WHERE memberid=?";      
			jdbcUtil.setSqlAndParameters(sql, new Object[] {memberID});	// JDBCUtil�� query���� �Ű� ���� ����

			try {
				ResultSet rs = jdbcUtil.executeQuery();		// query ����
				if (rs.next()) {
					int count = rs.getInt(1);
					return (count == 1 ? true : false);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				jdbcUtil.close();		// resource ��ȯ
			}
			return false;
		}
		
		//bookInfo�� �ִ� å�������� �ش� å�� rental count�� 1 ������.
		public int plusRentalCnt(int bookID) throws SQLException{
			rentalbookDAO retalbookdao = new rentalbookDAO();
			rentalBook rtBook = retalbookdao.findRentBook(bookID);
			String query = "Update bookInfo set rentalCnt = rentalCnt + 1 where bookinfoID = ?";
			Object[] param = new Object[] { rtBook.getBookInfoID() };
					
			try {	
				jdbcUtil.setSqlAndParameters(query, param);
				int result = jdbcUtil.executeUpdate();	
				return result;
			} catch (Exception ex) {
				jdbcUtil.rollback();
				ex.printStackTrace();
			} finally {		
				jdbcUtil.commit();
				jdbcUtil.close();	// resource ��ȯ
			}		
			return 0;
		}

}