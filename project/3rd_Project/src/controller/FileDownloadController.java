package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.SwitchExpression;

/**
 * Servlet implementation class FileDownloadController
 */
@WebServlet("/download.do")
public class FileDownloadController extends HttpServlet {
	/* ��� ���� */
	private static String POST_FILE_PATH; // ���� ���ε� ���
	
	public void init(ServletConfig config) throws ServletException {
		/* ��� ���� */
		String arg0 = "\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps";
		POST_FILE_PATH = config.getServletContext().getRealPath("/WebContent/postUpload").replace(arg0, "");
		System.out.println("�Խñ� ���� ���ε� ��� -- " + POST_FILE_PATH);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String board_category = request.getParameter("board_category");
		String num = request.getParameter("num"); 
		String downFileName = request.getParameter("downFileName");
				
		/* OutputStream */
		OutputStream out = response.getOutputStream();
		String path = POST_FILE_PATH + "\\" + board_category + "\\" + num + "\\" + downFileName; // ���� ��θ� ����
		File imageFile = new File(path);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + downFileName); // header ���� ����
		
		/* FileInputStream  */
		FileInputStream in = new FileInputStream(imageFile);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		
		/* ���� */
		in.close();
		out.close();
	}

}
