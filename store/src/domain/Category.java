package domain;

import java.io.Serializable;

/**
 * 菜单
 * @author Administrator
 *
 */
public class Category implements Serializable {
	private static final long serialVersionUID = -4621567068451609502L;
	private String cid;
	private String cname;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}
