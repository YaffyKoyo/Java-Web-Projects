package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemsDAO;
import entity.Cart;
import entity.Items;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action;
	private ItemsDAO idao = new ItemsDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("add")) {
				if(addToCart(request, response)){
					request.getRequestDispatcher("/success.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("/failing.jsp").forward(request, response);

				}
			}
			if (action.equals("show")) {
				showCart(request, response);
			}
		}
	}

	private void showCart(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private boolean addToCart(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String number = request.getParameter("num");
		Items item = idao.getItemsById(Integer.parseInt(id));
		
		//if first time add item to cart, create new cart object in session
		if(request.getSession().getAttribute("cart")==null){
			Cart cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart.addGoodsInCart(item, Integer.parseInt(number))){
			return true;
		}else{
			return false;
		}
	}
	
}
