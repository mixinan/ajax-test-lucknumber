package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionServlet extends HttpServlet {

	@Override
	protected void service(
			HttpServletRequest req, 
			HttpServletResponse res) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		System.out.println("uri:"+uri);
		
		String action = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println("action:"+action);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		
		
		if ("/luck".equals(action)) {
			int n = new Random().nextInt(2000);
			System.out.println(n);
			out.println(n);
		}else{
			out.println("wrong");
		}
		
	}
	
}
