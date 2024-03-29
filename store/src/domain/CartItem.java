package domain;

import java.io.Serializable;

/**
 * 购物车项
 * @author Administrator
 *
 */
public class CartItem implements Serializable {
	private Product product;//商品对象
	private Integer count;//购买数量
	private Double subtotal=0.0;//小计
	
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getSubtotal() {
		return count*product.getShop_price();
	}
	public CartItem(Product product, Integer count) {
		super();
		this.product = product;
		this.count = count;
	}
	public CartItem() {
	}
	
	

}
