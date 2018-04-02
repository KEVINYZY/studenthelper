package com.cms.Dao;

import com.cms.Entity.Coursetable;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoursetableDao {
    List<Coursetable> QueryCoursetableById (String username);
    
    void UpadteCoursetable (Coursetable coursetable);

    List<String> QueryDaytableById(@Param("day") String day, @Param("studentid") String studentid);
    
    void regester(String studentid);
}
