package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Nav;
import top.kissshot.myblog.pojo.NavExample;

@Mapper
public interface NavMapper {
	int deleteByPrimaryKey(Integer nid);

	int insert(Nav record);

	int insertSelective(Nav record);

	List<Nav> selectByExample(NavExample example);

	Nav selectByPrimaryKey(Integer nid);

	int updateByPrimaryKeySelective(Nav record);

	int updateByPrimaryKey(Nav record);

	Nav selectByUid(int uid);
}