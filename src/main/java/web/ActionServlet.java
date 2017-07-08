package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Stock;
import jdk.nashorn.internal.runtime.JSONFunctions;
import net.sf.json.JSONArray;

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
		}
		
		if("/quoto".equals(action)){
			List<Stock> data = new ArrayList<Stock>();
			for (int i = 0; i < 3; i++) {
				Stock s = new Stock(
						new Random().nextInt(1000)+"", 
						"ÐÂÀË"+new Random().nextInt(100), 
						new Random().nextInt(300));
						
				data.add(s);
						
			}
			
			JSONArray arr = JSONArray.fromObject(data);
			System.out.println(arr.toString());
			
			out.println(arr.toString());
		}
		
		
		
	}
	
}
