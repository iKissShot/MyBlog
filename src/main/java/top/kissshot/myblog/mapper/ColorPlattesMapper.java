package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.ColorPlattes;
import top.kissshot.myblog.pojo.ColorPlattesExample;

@Mapper
public interface ColorPlattesMapper {
	int deleteByPrimaryKey(Integer cid);

	int insert(ColorPlattes record);

	int insertSelective(ColorPlattes record);

	List<ColorPlattes> selectByExample(ColorPlattesExample example);

	ColorPlattes selectByPrimaryKey(Integer cid);

	int updateByPrimaryKeySelective(ColorPlattes record);

	int updateByPrimaryKey(ColorPlattes record);

	void viewCountUp(Integer cid);

	void likeCountUp(Integer cid);

	int getLastCid();
}