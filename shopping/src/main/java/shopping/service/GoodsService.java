package shopping.service;

import java.util.List;

import com.company.shopping.bean.Goods;

public interface GoodsService {
	List<?> getAllGoods();

	void save(Goods goods);

	List<?> getByType(int i);

	Goods getById(int id);

	int getTotalPage(int i);

	List<?> getPage(int currentPage);

	void updateGoodsById(Goods goods, Integer productid);

	void deleteGoodsById(Integer productid);

	

	

	List<?> getByTypeName(String searchname);
}
