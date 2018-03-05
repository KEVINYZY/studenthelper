package com.cms.Dao;


import java.util.List;

import com.cms.Entity.User;
import com.cms.Survice.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    User QueryUserById();
}