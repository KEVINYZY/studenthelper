package com.cms.Dao;

import com.cms.Entity.Examschedule;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExamscheduleDao {
    void addExamschedule(Examschedule examschedule);
    
    List<Examschedule> QueryExamscheduleById(String studentid);
    
    void DeleteExamscheduleByName(String examname, String studentid);
}
