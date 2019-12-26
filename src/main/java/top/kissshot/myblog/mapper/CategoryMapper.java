package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Category;
import top.kissshot.myblog.pojo.CategoryExample;

@Mapper
public interface CategoryMapper {
	int deleteByPrimaryKey(Integer cid);

	int insert(Category record);

	int insertSelective(Category record);

	List<Category> selectByExample(CategoryExample example);

	Category selectByPrimaryKey(Integer cid);

	int updateByPrimaryKeySelective(Category record);

	int updateByPrimaryKey(Category record);

	void updateOrder(Category c);

	void updateName(Category c);

	int getLastCidByNid(int nid);

	List<Category> listByNid(Integer nid);
}