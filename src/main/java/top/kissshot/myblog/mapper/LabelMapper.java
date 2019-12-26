package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Label;
import top.kissshot.myblog.pojo.LabelExample;

@Mapper
public interface LabelMapper {
    int deleteByPrimaryKey(Integer lid);

    int insert(Label record);

    int insertSelective(Label record);

    List<Label> selectByExample(LabelExample example);

    Label selectByPrimaryKey(Integer lid);

    int updateByPrimaryKeySelective(Label record);

    int updateByPrimaryKey(Label record);
}