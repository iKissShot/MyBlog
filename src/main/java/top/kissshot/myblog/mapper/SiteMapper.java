package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import top.kissshot.myblog.pojo.Site;
import top.kissshot.myblog.pojo.SiteExample;

@Mapper
public interface SiteMapper {
	int deleteByPrimaryKey(Integer sid);

	int insert(Site record);

	int insertSelective(Site record);

	List<Site> selectByExample(SiteExample example);

	Site selectByPrimaryKey(Integer sid);

	int updateByPrimaryKeySelective(Site record);

	int updateByPrimaryKey(Site record);

	void updateUrl(Site site);

	void updateName(Site site);

	void updateOrder(Site site);

	int getLastSidByCid(Site s);

	List<Site> listByCid(Integer cid);
}