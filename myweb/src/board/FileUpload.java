package board;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;


public class FileUpload {

	//업로드 파일이 저장될 기본 위치 설정을 위한 문자열
	private String root = null;
	
	//생성자 : 업로드 파일이 저장될 기본 위치를 받아서 생성
	public FileUpload(String root) {
		this.root = root;
	}
	public ArrayList<String> upload(HttpServletRequest request, String Folder) {
		// 업로드 위치(경로)를 저장하기 위한 리스트
		ArrayList<String> upload_list = new ArrayList<String>();

		// 디스크에 파일을 쓰기위한 Factory 객체 생성
		FileItemFactory factory = new DiskFileItemFactory();
		
		// Servlet에 업로드 요청한 파일을 생성된 Factory 객체를 이용해서 처리할 수 있게함.
		ServletFileUpload upload = new ServletFileUpload(factory);

		try {
			// request 메시지에서 업로드한 파일 정보를 추출하여 List 로 반환
			ArrayList<FileItem> items = (ArrayList<FileItem>)upload.parseRequest(
					new ServletRequestContext(request));
			
			for(FileItem item: items) {
				// 일반 form 입력 필드인지 체크
				if (!item.isFormField()) { // 일반 form 입력 필드가 아닌 file 에 대한 처리만 수행
					String fileName = item.getName();  // 파일명 추출
					
					// 기본 저장 위치에서 /upload 디렉터리에 파일을 저장하도록 추가 경로 설정
					File path = new File(root + "/" + Folder);
					
					// /upload 디렉터리가 존재하지 않는 경우 해당 디렉터리 생성
					if (!path.exists()) {
						path.mkdirs();
					}
					
					// 업로드된 파일 명으로 정해둔 디렉터리에 생성
					File uploadedFile = new File(path + "/" + fileName);
					
					// 파일쓰기 작업 진행
					item.write(uploadedFile);
					
					// 저장된 파일의 절대 경로 추출
					upload_list.add(uploadedFile.getAbsolutePath());
				}
			}
		} catch (FileUploadException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return upload_list;
	}

}

	

