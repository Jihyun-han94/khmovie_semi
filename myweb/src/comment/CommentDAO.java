package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import comment.CommentVO;

public class CommentDAO {
	private CommentDAO() {
		
	}
	private static CommentDAO instance = new CommentDAO();
	
	public static CommentDAO getInstance() {
		return instance;
	}
	public Connection getConnection() {
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/Oracle");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public void closeConnection(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void hitUp(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "update s_board set hit = hit+1 where num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con);
		}
	}
	
	public void hitDown(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "update s_board set hit = hit-1 where num = ?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, num);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con);
		}
	}
	//댓글 DAO
	public void commentWrite(CommentVO mVo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "insert into s_comment values(seq_comment.nextval,?,?,sysdate,?)";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mVo.getCid());
			pstmt.setString(2, mVo.getCcontent());
			pstmt.setInt(3, mVo.getCparentnum());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con);
		}

	}
	// 댓글 페이지 처리하는 쿼리 
	/*public ArrayList<CommentVO> commentView(String num,int page) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentVO> list = new ArrayList<>();
		String sql = "select c.c_num, c.c_id, c.c_content, c.c_time, rnum from (select num from((select num from s_board) union (select r_num num from s_reply))) b, (select rownum rnum,d.c_num,d.c_id,d.c_content,d.c_time,d.parentnum from (select num from((select num from s_board) union (select r_num num from s_reply)))e ,(select c_num,c_id,c_content,c_time,parentnum  from s_comment order by c_num desc) d  where e.num = d.parentnum and e.num = ?) c where b.num = c.parentnum and b.num = ? and rnum between ? and ?";
		int start = (page - 1) * 5 + 1;
		int end = start + 4;

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, num);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentVO mVo = new CommentVO();
				mVo.setCnum(rs.getInt("c_num"));
				mVo.setCid(rs.getString("c_id"));
				mVo.setCcontent(rs.getString("c_content"));
				mVo.setCdate(rs.getTimestamp("c_date"));
				list.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con);
		}
		return list;
	}
	*/

	//댓글이 존재하는지 확인하는 쿼리
	public int commentCheck(String num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select * from s_comment where parentnum=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con);
		}
		return result;
	}
	

	public CommentVO selectComment(String cnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentVO mVo = new CommentVO();
		
		String sql = "select * from s_comment where c_num = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mVo.setCcontent(rs.getString("c_content"));
				mVo.setCid(rs.getString("c_id"));
				mVo.setCparentnum(rs.getInt("parentnum"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con);
		}
		return mVo;
	}
	//댓글 수정
	public void commentUpdate(String cnum, String ccontent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "update s_comment set c_content=? where c_num=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ccontent);
			pstmt.setString(2, cnum);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con);
		}
	}
	//댓글 삭제
	public void commentDelete(String cnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from s_comment where c_num = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cnum);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con);
		}
		
	}
	
	//댓글수 조회
	public ArrayList<CommentVO> commentCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentVO> clist = new ArrayList<>();
		String sql = "select count(c.parentnum) c_count,b.num num from s_board b, s_comment c where b.num = c.parentnum(+) group by c.parentnum,b.num union select count(c.parentnum) c_count,r.r_num num from s_reply r, s_comment c where r.r_num = c.parentnum(+) group by c.parentnum,r.r_num";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentVO mVo = new CommentVO();
			//	mVo.setB_Num(rs.getInt("b_num")); //게시판 넘버
				mVo.setCcount(rs.getInt("c_count"));
				clist.add(mVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(con);
		}
		return clist;
	}
	//댓글 페이징처리 쿼리
	/*
			public int commentTotalCount(String num) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				int totalCount = 0;
				
				String sql = "select count(*) from s_comment where parentnum=?";
				try {
					con = getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, num);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						totalCount = rs.getInt("count(*)");
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					closeConnection(con);
				}
				return totalCount;
			}
*/
	
}
