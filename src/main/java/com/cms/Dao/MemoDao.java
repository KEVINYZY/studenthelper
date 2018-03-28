package com.cms.Dao;


import com.cms.Entity.Memo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemoDao {
    void addMemo(Memo memo);
    
    List<Memo> QueryMemoById(@Param("studentid") String studentid);
}
