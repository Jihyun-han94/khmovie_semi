package Comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CommentServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//response.setContentType("application/json");
		
		String C_USERID = request.getParameter("userid");
		String C_COMMENT = request.getParameter("C_COMMENT");
		String B_TITLE = request.getParameter("B_TITLE");
		int B_NUM = Integer.parseInt(request.getParameter("B_NUM"));
		
		System.out.println(C_USERID);
		System.out.println(C_COMMENT);
		System.out.println(B_TITLE);
		System.out.println(B_NUM);
		
		CommentVO data = new CommentVO(B_NUM, B_TITLE,C_USERID,C_COMMENT);
		
		CommentDAO comment = new CommentDAO();
		comment.saveData(data); //COMMENT_T에 data 저장
		ArrayList<CommentVO> datas = comment.getAll();
		comment.close();
		
	
		
		
		
		
		
		/*
		PrintWriter out = response.getWriter();
		String json="";
		
		json += "{";
		json += "\"C_USERID\":" + "\"" + C_USERID + "\",";
		json += "\"C_COMMENT\":" + "\"" + C_COMMENT + "\",";
		json += "\"B_TITLE\":" + "\"" + B_TITLE + "\",";
		json += "\"B_NUM\":" + "\"" + B_NUM + "\"";
		json += "}";
		
		out.println(json);
        */
    
		
	}

}
