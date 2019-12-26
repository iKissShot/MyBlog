package top.kissshot.myblog.pojo;

public class Site {
	private Integer sid;

	private Integer cid;

	private Integer order;

	private String name;

	private String url;

	private String icon;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon == null ? null : icon.trim();
	}

	@Override
	public String toString() {
		return "Site [sid=" + sid + ", cid=" + cid + ", order=" + order + ", name=" + name + ", url=" + url + ", icon="
				+ icon + "]";
	}

}