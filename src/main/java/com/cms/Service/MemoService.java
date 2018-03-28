package com.cms.Service;

import com.cms.Dao.MemoDao;
import com.cms.Entity.Memo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MemoService {
    Logger logger = Logger.getLogger(this.getClass());
    @Resource
    private MemoDao memoDao;
    
    public void addMemo(Memo memo){
        logger.info("添加备忘录");
        memoDao.addMemo(memo);
    }
    
    public List<Memo> QueryMemoById(String studentid){
        logger.info("获取备忘录");
        return memoDao.QueryMemoById(studentid);
    }
}
