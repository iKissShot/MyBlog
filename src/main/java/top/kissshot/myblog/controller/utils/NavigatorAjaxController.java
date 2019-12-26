package top.kissshot.myblog.controller.utils;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import top.kissshot.myblog.mapper.CategoryMapper;
import top.kissshot.myblog.mapper.NavMapper;
import top.kissshot.myblog.mapper.SiteMapper;
import top.kissshot.myblog.pojo.Category;
import top.kissshot.myblog.pojo.Nav;
import top.kissshot.myblog.pojo.Site;

@RestController
public class NavigatorAjaxController {

	@Autowired
	NavMapper navMapper;

	@Autowired
	CategoryMapper categoryMapper;

	@Autowired
	SiteMapper siteMapper;

	@GetMapping("/Utils/Nav/changeTheme/{theme}")
	public String changeTheme(@PathVariable String theme, HttpServletRequest req) {
		int uid = Integer.parseInt(req.getSession().getAttribute("uid") + "");
		Nav nav = navMapper.selectByUid(uid);
		nav.setType(theme);
		navMapper.updateByPrimaryKeySelective(nav);
		return theme;
	}

	@GetMapping("/Utils/Nav/deleteSite/{sid}")
	public boolean deleteSite(@PathVariable Integer sid) {
		try {
			Site site = siteMapper.selectByPrimaryKey(sid);
			Category category = categoryMapper.selectByPrimaryKey(site.getCid());
			category.setCount(category.getCount() - 1);
			categoryMapper.updateByPrimaryKeySelective(category);
			siteMapper.deleteByPrimaryKey(sid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@PutMapping("/Utils/Nav/addSite")
	public int addSite(@RequestBody Site site) {
		Site s = new Site();
		s.setCid(site.getCid());
		s.setName(site.getName());
		s.setUrl(site.getUrl());
		s.setOrder(site.getOrder());
		s.setIcon("icon");
		Category category = categoryMapper.selectByPrimaryKey(site.getCid());
		category.setCount(category.getCount() + 1);
		categoryMapper.updateByPrimaryKeySelective(category);
		siteMapper.insertSelective(site);
		int sid = siteMapper.getLastSidByCid(s);
		return sid;
	}

	@PutMapping("/Utils/Nav/reNameSite")
	public boolean reNameSite(@RequestBody Site site) {
		try {
			siteMapper.updateName(site);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@PutMapping("/Utils/Nav/reUrlSite")
	public boolean reUrlSite(@RequestBody Site site) {
		try {
			siteMapper.updateUrl(site);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@GetMapping("/Utils/Nav/reOrderSite/{sid}/{order}")
	public boolean reOrderSite(@PathVariable int sid, @PathVariable int order) {
		try {
			Site s = new Site();
			s.setSid(sid);
			s.setOrder(order);
			siteMapper.updateOrder(s);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@PutMapping("/Utils/Nav/addCategory")
	public int addCategory(@RequestBody Category category, HttpServletRequest req) {
		int uid = Integer.parseInt(req.getSession().getAttribute("uid") + "");
		category.setNid(navMapper.selectByUid(uid).getNid());
		categoryMapper.insertSelective(category);
		int cid = categoryMapper.getLastCidByNid(category.getNid());
		return cid;
	}

	@GetMapping("/Utils/Nav/delCategory/{cid}")
	public boolean delCategory(@PathVariable int cid) {
		try {
			List<Site> sites = siteMapper.listByCid(cid);
			for (Site s : sites)
				siteMapper.deleteByPrimaryKey(s.getSid());
			categoryMapper.deleteByPrimaryKey(cid);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@PutMapping("/Utils/Nav/reNameCategory")
	public boolean reNameCategory(@RequestBody Category category) {
		try {
			categoryMapper.updateName(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@GetMapping("/Utils/Nav/reOrderCategory/{cid}/{order}")
	public boolean reOrderCategory(@PathVariable int cid, @PathVariable int order) {
		try {
			Category c = new Category();
			c.setCid(cid);
			c.setOrder(order);
			categoryMapper.updateOrder(c);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}