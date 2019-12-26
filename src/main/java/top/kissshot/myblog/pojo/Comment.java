package top.kissshot.myblog.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
	private Integer cid;

	private Integer uid;

	private Integer aid;

	private Integer pcid;

	private String content;

	private Integer likeCount;

	private Date date;

	private String easyDate;

	public Comment() {
		super();
//		transEasyDate();
	}

	public Comment(int uid, int aid, int pcid, String content, Date date) {
		this.uid = uid;
		this.aid = aid;
		this.pcid = pcid;
		this.content = content;
		this.date = date;
	}

	public void transEasyDate() {
		this.easyDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
	}

	public String getEasyDate() {
		return easyDate;
	}

	public void setEasyDate(String easyDate) {
		this.easyDate = easyDate;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getPcid() {
		return pcid;
	}

	public void setPcid(Integer pcid) {
		this.pcid = pcid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", uid=" + uid + ", aid=" + aid + ", pcid=" + pcid + ", content=" + content
				+ ", likeCount=" + likeCount + ", date=" + date + ", easyDate=" + easyDate + "]";
	}
}