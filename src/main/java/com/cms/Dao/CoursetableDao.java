package com.cms.Dao;

import com.cms.Entity.Coursetable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoursetableDao {
    List<Coursetable> QueryCoursetableById (String username);
    
    void UpadteCoursetable (Coursetable coursetable);
    
    List<String> QueryCoursetableByDay(String day, String studentid);
}
