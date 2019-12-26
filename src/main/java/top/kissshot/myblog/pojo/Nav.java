package top.kissshot.myblog.pojo;

public class Nav {
	private Integer nid;

	private Integer uid;

	private String type;

	public Integer getNid() {
		return nid;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	@Override
	public String toString() {
		return "Nav [nid=" + nid + ", uid=" + uid + ", type=" + type + "]";
	}

}