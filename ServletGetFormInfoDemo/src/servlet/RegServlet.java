package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Users;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Users u = new Users();
		String username,mypassword,gender,email,introduce,isAccept;
		Date birthday;
		String[] favorites;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
			username = request.getParameter("username");
			mypassword = request.getParameter("mypassword");
			gender = request.getParameter("gender");
			email = request.getParameter("email");
			introduce = request.getParameter("introduce");
			birthday = sdf.parse(request.getParameter("birthday"));
			favorites = request.getParameterValues("hobby");
			isAccept = request.getParameter("isAccept");
			if(request.getParameterValues("isAccept")!=null){
				isAccept = request.getParameter("isAccept");
			}else{
				isAccept = "false";
			}
			
			
			u.setUsername(username);
			u.setMypassword(mypassword);
			u.setGender(gender);
			u.setEmail(email);
			u.setFavorites(favorites);
			if(isAccept.equals("true")){
				u.setFlag(true);
			}else{
				u.setFlag(false);
			}
			
			u.setBirthday(birthday);
			u.setIntroduce(introduce);
			
			//save the registered user to session
			request.getSession().setAttribute("regUser", u);
			
			request.getRequestDispatcher("../userinfo.jsp;").forward(request, response);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
