package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Article;
import top.kissshot.myblog.pojo.ArticleExample;

@Mapper
public interface ArticleMapper {
	int deleteByPrimaryKey(Integer aid);

	int insert(Article record);

	int insertSelective(Article record);

	List<Article> selectByExample(ArticleExample example);

	Article selectByPrimaryKey(Integer aid);

	int updateByPrimaryKey(Article record);

	List<Article> findByUid(Integer uid);

	void updateContent(Article article);

	void likeCountUp(Integer aid);

	void viewCountUp(Integer aid);
	
	void commentCountUp(Integer aid);

	List<Article> listBySid(int sid);
}