package top.kissshot.myblog.pojo;

public class ColorPlattes {
	private Integer cid;

	private String color1;

	private String color2;

	private String color3;

	private String color4;

	private Integer viewcount;

	private Integer likecount;

	private String date = "最近";

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getColor1() {
		return color1;
	}

	public void setColor1(String color1) {
		this.color1 = color1 == null ? null : color1.trim();
	}

	public String getColor2() {
		return color2;
	}

	public void setColor2(String color2) {
		this.color2 = color2 == null ? null : color2.trim();
	}

	public String getColor3() {
		return color3;
	}

	public void setColor3(String color3) {
		this.color3 = color3 == null ? null : color3.trim();
	}

	public String getColor4() {
		return color4;
	}

	public void setColor4(String color4) {
		this.color4 = color4 == null ? null : color4.trim();
	}

	public Integer getViewcount() {
		return viewcount;
	}

	public void setViewcount(Integer viewcount) {
		this.viewcount = viewcount;
	}

	public Integer getLikecount() {
		return likecount;
	}

	public void setLikecount(Integer likecount) {
		this.likecount = likecount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date == null ? null : date.trim();
	}

	@Override
	public String toString() {
		return "ColorPlattes [cid=" + cid + ", color1=" + color1 + ", color2=" + color2 + ", color3=" + color3
				+ ", color4=" + color4 + ", viewcount=" + viewcount + ", likecount=" + likecount + ", date=" + date
				+ "]";
	}

	public ColorPlattes(Integer cid, String color1, String color2, String color3, String color4, Integer viewcount,
			Integer likecount, String date) {
		super();
		this.cid = cid;
		this.color1 = color1;
		this.color2 = color2;
		this.color3 = color3;
		this.color4 = color4;
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.date = date;
	}

	public ColorPlattes() {
		super();
	}

	public ColorPlattes(String c1, String c2, String c3, String c4) {
		this.color1 = c1;
		this.color2 = c2;
		this.color3 = c3;
		this.color4 = c4;
	}

}