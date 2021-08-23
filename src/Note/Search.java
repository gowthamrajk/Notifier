package Note;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class Search extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String searchText = request.getParameter("searchtext");
		request.setAttribute("searchingText",searchText);
		RequestDispatcher rd=request.getRequestDispatcher("searchResult.jsp");  
        rd.forward(request,response);  
		System.out.println(searchText);
	}
}