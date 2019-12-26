package top.kissshot.myblog.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
	private Integer aid;

	private Integer uid;

	private Integer sid;

	private String lid;

	private String title;

	private String content;

	private Integer viewCount;

	private Integer likeCount;

	private Integer commentCount;

	private Date date;

	private String easyDate;

	public Article() {
		super();
//		transEasyDate();
	}

	public String getEasyDate() {
		return easyDate;
	}

	public void transEasyDate() {
		this.easyDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid == null ? null : lid.trim();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Article [aid=" + aid + ", uid=" + uid + ", sid=" + sid + ", lid=" + lid + ", title=" + title
				+ ", content=" + content + ", viewCount=" + viewCount + ", likeCount=" + likeCount + ", commentCount="
				+ commentCount + ", date=" + date + ", easyDate=" + easyDate + "]";
	}

}