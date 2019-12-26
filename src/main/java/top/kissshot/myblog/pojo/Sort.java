package top.kissshot.myblog.pojo;

public class Sort {
	private Integer sid;

	private Integer psid;

	private String name;

	private String alias;

	private String description;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getPsid() {
		return psid;
	}

	public void setPsid(Integer psid) {
		this.psid = psid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias == null ? null : alias.trim();
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	@Override
	public String toString() {
		return "Sort [sid=" + sid + ", psid=" + psid + ", name=" + name + ", alias=" + alias + ", description="
				+ description + "]";
	}

}