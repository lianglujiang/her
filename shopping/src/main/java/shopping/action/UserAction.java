package shopping.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.company.shopping.bean.User;
import com.company.shopping.service.UserService;
import com.company.shopping.service.impl.UserServiceImpl;
import com.company.shopping.util.VerifyCode;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private User user;
	private String username;
	private String password;
	
	private String verifyCode;
	private List<?> userlist;


	
	public List<?> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<?> userlist) {
		this.userlist = userlist;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String list() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	/**
	 * ��̨��½
	 * @return
	 * @throws Exception
	 */
	public String checklogin() throws Exception {
		//return SUCCESS;
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String vc = (String) session.getAttribute("VerifyCode");
		if(!vc.equalsIgnoreCase(verifyCode)){
			session.setAttribute("error", "��֤�����");
			return ERROR;
		}
		User user = userService.checklogin(username,password);
		if(user!=null&&user.getRole().getId()==1){
			session.setAttribute("user", user);
			return SUCCESS;
		}
		session.setAttribute("message", "Ȩ�޲���");
		return ERROR;
	}
	
	public String logout() {
		ServletActionContext.getRequest().removeAttribute("user");
		return SUCCESS;
	}
	
	public String verifycode(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		VerifyCode.getVerifyCode(request , response );
		
		return null;
	}
	//ע��Ԥ��������ע��ҳ��
	public String register(){
		return SUCCESS;	
	}
	
	public String saveUser() {
		// TODO Auto-generated method stub
		userService.save(user);
		return SUCCESS;	
	}
	//�û��б�
	public String userList() {
		// TODO Auto-generated method stub
		userlist = userService.findAll();
		return SUCCESS;	
	}
	//����idɾ���û�
	public String deleteUserById() {
		// TODO Auto-generated method stub
		userService.deleteById(user);
		return SUCCESS;	
	}
	/**
	 * ǰ̨�û���½
	 * @return
	 */
	public String  userLogin() {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		String vc = (String) session.getAttribute("VerifyCode");
		if(!vc.equalsIgnoreCase(verifyCode)){
			session.setAttribute("error", "��֤�����");
			return ERROR;
		}
		User user = userService.checklogin(username,password);
		if(user!=null){
			session.setAttribute("user", user);
			return SUCCESS;
		}
		return ERROR;	
	}
	
	public String userLogout() {
		ServletActionContext.getRequest().getSession().invalidate();;
		//ServletActionContext.getRequest().removeAttribute("user");
		return SUCCESS;
	}
	
	
}
