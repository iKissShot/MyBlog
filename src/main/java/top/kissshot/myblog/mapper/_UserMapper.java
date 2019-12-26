package top.kissshot.myblog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import top.kissshot.myblog.pojo._User;

@Mapper
public interface _UserMapper {

	@Insert("INSERT INTO user(name, pwd, email) VALUES(#{name}, #{pwd}, #{email})")
	int save(_User user);

	@Delete("DELETE FROM user WHERE uid = #{uid}")
	int delete(int uid);

	@Update("UPDATE user SET name=#{name}, pwd = #{pwd}, email = #{email} WHERE uid = #{uid}")
	int update(_User user);

	@Select("SELECT * FROM user")
	List<_User> list();

	@Select("SELECT * FROM user WHERE uid = #{uid}")
	_User get(int uid);
}