package shopping.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.company.shopping.bean.GType;
import com.company.shopping.bean.Goods;
import com.company.shopping.service.GTService;
import com.company.shopping.service.GoodsService;
import com.company.shopping.util.Util;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GoodsAction extends ActionSupport implements ModelDriven<GType>{
	
	
	private GoodsService goodsService;
	private GTService gtService;
	
	private int totalPage=0;
	private int currentPage=1;
	private int rowTotal=0;
	private List<?> list;
	private List<?> gtlist;
	private Goods goods;
	
	
	
	public int getRowTotal() {
		return rowTotal;
	}

	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}

	private GType type = new GType();
	private Integer productid;


	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public void setGtService(GTService gtService) {
		this.gtService = gtService;
	}

	
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public List<?> getGtlist() {
		return gtlist;
	}



	public void setGtlist(List<?> gtlist) {
		this.gtlist = gtlist;
	}



	public List<?> getList() {
		return list;
	}



	public void setList(List<?> list) {
		this.list = list;
	}



	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}



	public String list() {
		if(totalPage==0){
			totalPage = goodsService.getTotalPage(10);
		}
		if(totalPage==0){
			rowTotal = goodsService.getAllGoods().size();
		}
		if(currentPage<0){
			currentPage=1;
		}
		list = goodsService.getPage(currentPage);

		return "success";
	}
	
	public String addgoodstype() {
		gtlist = gtService.getAll();
		gtlist = Util.parse(0, "", (List<GType>) gtlist);
		return "success";
	}
	
	public String savetype() {
		gtService.save(type);
		return "success";
	}
	
	public GType getModel() {
		// TODO Auto-generated method stub
		return type;
	}
	
	public String typelist(){
		gtlist = gtService.getAll();
		
		return SUCCESS;
	}
	
	public String addgoods(){
		gtlist = gtService.getAll();
		gtlist = Util.parse(0, "", (List<GType>) gtlist);
		return SUCCESS;
	}
	
	public String savegoods() throws Exception{
		
		goods.setGoodspic(goods.getGoodspic().substring(1));
		System.out.println(goods.getGoodspic()+"1111111111--多了一个逗号在此处截取，找到后删去上面一行--111111111111111");
		//System.out.println(goods.getGoodsname());
		//System.out.println(goods.getGoodstype().getId());
		goodsService.save(goods);
		return SUCCESS;
	}

	
	//根据Id查找商品
	public String findProductById(){
			
			//List<?> goodsList=(List<?>) goodsService.getById(productid);
			
			gtlist = gtService.getAll();
			return SUCCESS;
			
	}
		
		//根据Id更新商品
	public String updategoods(){		
			goodsService.updateGoodsById(goods,productid);
			return SUCCESS;
	}
		
	public String deleteGoodsById(){
		goodsService.deleteGoodsById(productid);

			return SUCCESS;
	}
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	
}	
