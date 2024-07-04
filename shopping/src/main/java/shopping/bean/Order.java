package shopping.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="tbl_order")
public class Order {
private Integer id;
private User user;
private Goods goods;
private Date buytime;
private Integer total;
private String status;
@Id
@GeneratedValue
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}

@OneToOne
@JoinColumn(name="uid")
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
@OneToOne
@JoinColumn(name="gid")
public Goods getGoods() {
	return goods;
}
public void setGoods(Goods goods) {
	this.goods = goods;
}

public Date getBuytime() {
	return buytime;
}
public void setBuytime(Date buytime) {
	this.buytime = buytime;
}
public Integer getTotal() {
	return total;
}
public void setTotal(Integer total) {
	this.total = total;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
	
}
