package shopping.bean;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "tbl_goods")
public class Goods implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodsname;
	private GType goodstype;
	private Integer count;
	private Float price;
	private String goodspic;
	private String goodsdesc;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(String goodsname, GType goodstype, Integer count,
			Float price, String goodspic, String goodsdesc) {
		this.goodsname = goodsname;
		this.goodstype = goodstype;
		this.count = count;
		this.price = price;
		this.goodspic = goodspic;
		this.goodsdesc = goodsdesc;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "goodsname")
	public String getGoodsname() {
		return this.goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	@ManyToOne
	@JoinColumn(name="goodstype")
	public GType getGoodstype() {
		return this.goodstype;
	}

	public void setGoodstype(GType goodstype) {
		this.goodstype = goodstype;
	}

	@Column(name = "count")
	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Column(name = "price", precision = 12, scale = 0)
	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name = "goodspic")
	public String getGoodspic() {
		return this.goodspic;
	}

	public void setGoodspic(String goodspic) {
		this.goodspic = goodspic;
	}

	@Column(name = "goodsdesc")
	public String getGoodsdesc() {
		return this.goodsdesc;
	}

	public void setGoodsdesc(String goodsdesc) {
		this.goodsdesc = goodsdesc;
	}

}
