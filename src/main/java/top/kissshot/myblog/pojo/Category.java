package top.kissshot.myblog.pojo;

public class Category {
	private Integer cid;

	private Integer nid;

	private Integer order;

	private String name;

	private Integer count;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Category [cid=" + cid + ", nid=" + nid + ", order=" + order + ", name=" + name + ", count=" + count
				+ "]";
	}

}