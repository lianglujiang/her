package shopping.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.apache.bcel.generic.ARRAYLENGTH;

import com.company.shopping.bean.GType;
import com.company.shopping.bean.Goods;
import com.company.shopping.bean.ShopCar;
import com.company.shopping.bean.User;
import com.company.shopping.service.CarService;
import com.company.shopping.service.GTService;
import com.company.shopping.service.GoodsService;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	
	private int buytotal;
	private CarService carService;
	
	private List<?> elist;

	private int gid;//��ҳ�洫�ݹ�����
	
	

	private Goods goods;

	private String goodsname;



	private GoodsService goodsService;
	private GTService gtService;
	private int id;

	private List<?> shopCarinGoods;

	private List<?> topTypeList; // �������


	private int pid;


	private List<GType> navigation;//������


	private String downType;//��Ʒ��������
	
	private String searchname;
	
	public String getSearchname() {
		return searchname;
	}
	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}
	public String getDownType() {
		return downType;
	}
	public void setDownType(String downType) {
		this.downType = downType;
	}
	public List<GType> getNavigation() {
		return navigation;
	}
	public void setNavigation(List<GType> navigation) {
		this.navigation = navigation;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	/**
	 * ��ӹ��ﳵ
	 * @return
	 */
	public String addcar(){
		ShopCar sc = new ShopCar();
		User user = new User();
		User sessionUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		//System.out.println(sessionUser.getId()+"sessionUser.getId()sessionUser.getId()");
		if(null==sessionUser){
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("���ȵ�¼", "���ȵ�¼");
			return ERROR;
		}
		user.setId(sessionUser.getId());
		sc.setUser(user);
		Goods goods = new Goods();
		System.out.println(gid);
		goods.setId(gid);
		
//		Set<Goods> goodsList = new HashSet<Goods>();
//		goodsList.add(goods);
		sc.setGoods(goods);
		
		sc.setGname(goodsname);
		sc.setBuytime(new Date());
		sc.setBuytotal(buytotal);
		carService.addCar(sc);
		return SUCCESS;
	}
	@Override
	public String execute() throws Exception {
		topTypeList = gtService.findByPid(0);
		elist = goodsService.getByType(3);
		System.out.println(elist.size());
		return super.execute();
	}
	
	public String showType() {
		topTypeList = gtService.findByPid(0);
		//System.out.println(pid+"=============");
		navigation = (List<GType>) gtService.findByPid(pid);
		/*HttpSession session = ServletActionContext.getRequest().getSession();
		List ll = new ArrayList();
		for ( GType n:navigation) {
			downType=n.getTypename();
			
			ll.add(downType);
		}
		session.setAttribute("downname", ll);*/
		elist = goodsService.getByType(pid);
		return SUCCESS;
	}
	
	
	public String searchname(){
		
		topTypeList = gtService.findByPid(0);
		navigation = (List<GType>) gtService.findByPid(pid);
		elist = goodsService.getByTypeName(searchname);
		return SUCCESS;
	}
	/**
	 * 
	 * @return
	 */
	public String showcar() {
		User sessionUser = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(null==sessionUser){
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("���ȵ�¼", "���ȵ�¼");
			return ERROR;
		}
		int uid = sessionUser.getId();
		shopCarinGoods = carService.getByUid(uid);
		return SUCCESS;
	}
	/**
	 * 
	 * @return
	 */
	public String showgoods() throws Exception {
		goods = goodsService.getById(id);
		return SUCCESS;
	}
	public int getBuytotal() {
		return buytotal;
	}


	public List<?> getElist() {
		return elist;
	}
	
	

	public int getGid() {
		return gid;
	}

	public Goods getGoods() {
		return goods;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public int getId() {
		return id;
	}

	public List<?> getShopCarinGoods() {
		return shopCarinGoods;
	}

	public List<?> getTopTypeList() {
		return topTypeList;
	}

	public void setBuytotal(int buytotal) {
		this.buytotal = buytotal;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	public void setElist(List<?> elist) {
		this.elist = elist;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	
	
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	public void setGtService(GTService gtService) {
		this.gtService = gtService;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setShopCarinGoods(List<?> shopCarinGoods) {
		this.shopCarinGoods = shopCarinGoods;
	}

	public void setTopTypeList(List<?> topTypeList) {
		this.topTypeList = topTypeList;
	}
	

}
