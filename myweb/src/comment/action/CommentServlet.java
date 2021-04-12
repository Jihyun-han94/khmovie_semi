package comment.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CommentServlet() {
        super();
       
    }
    /**
     * ���� ���� init
     */
	public void init(ServletConfig config) throws ServletException {
		loadProperties("");
	}
	
	/**
	 * ������Ƽ ���Ͽ��� Ű���� Ŭ���� ������ �����Ͽ� �װ��� Map�� �����Ѵ�.
	 * @param filePath ������Ƽ ������ ���
	 */
	private void loadProperties(String filePath)
	{
		commandMap = new HashMap<String, Action>();
        
        ResourceBundle rb = ResourceBundle.getBundle(filePath);
        Enumeration<String> actionEnum = rb.getKeys(); // Ű���� �����´�.
         
        while (actionEnum.hasMoreElements()) 
        {
            // ��ɾ �����´�.
            String command = actionEnum.nextElement(); 
            // ��ɾ �ش��ϴ� Action Ŭ���� �̸��� �����´�.
            String className = rb.getString(command); 
            
            try {
                 Class actionClass = Class.forName(className); // Ŭ���� ����
                 Action actionInstance = (Action)actionClass.newInstance(); // Ŭ������ ��ü�� ����
                 
                 // �ʿ� ��ɾ�� Action�� ��´�.
                 commandMap.put(command, actionInstance);
                
            } catch (Exception e) {
                e.printStackTrace();
            }        
        }
	}
	/**
	 * GET ����� ��� doGet()
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}
	private void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// �Ѿ�� Ŀ�ǵ带 �����ϴ� ����
        String requestURI = request.getRequestURI();
        int cmdIdx = requestURI.lastIndexOf("/") + 1;
        String command = requestURI.substring(cmdIdx);
 
        // URI, command Ȯ��
        // System.out.println("requestURI : "+requestURI);
        //System.out.println("Board cmd : "+command);
        
        ActionForward forward = null;
        Action action = null;
        
        try {
            // �ʿ��� ��ɾ �ش��ϴ� Action�� �����´�.
            action = commandMap.get(command);
            
            if (action == null) {
                System.out.println("��ɾ� : "+command+"�� �߸��� ����Դϴ�.");
                return;
            }
 
            forward = action.execute(request, response);
            
            /*
             * ȭ���̵� - isRedirext() ���� ���� sendRedirect �Ǵ� forward�� ���
             * sendRedirect : ���ο� ������������ request�� response��ü�� ���Ӱ� �����ȴ�.
             * forward : ���� �������� �������� forwad�� ���� ȣ��� �������� request�� response ��ü�� ����
             */
            if(forward != null){
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getNextPath());
                } else {
                    RequestDispatcher dispatcher = request
                            .getRequestDispatcher(forward.getNextPath());
                    dispatcher.forward(request, response);
                }
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    } // end doProcess              

}
