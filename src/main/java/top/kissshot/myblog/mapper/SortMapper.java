package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Sort;
import top.kissshot.myblog.pojo.SortExample;

@Mapper
public interface SortMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Sort record);

    int insertSelective(Sort record);

    List<Sort> selectByExample(SortExample example);

    Sort selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Sort record);

    int updateByPrimaryKey(Sort record);
}