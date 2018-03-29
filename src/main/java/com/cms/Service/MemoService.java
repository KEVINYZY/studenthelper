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
    
    public void updateMemo(Memo memo){
        logger.info("更新备忘录");;
        memoDao.updateMemo(memo);
    }
    
    public void deleteMemo(String studentid,String createtime){
        logger.info("删除备忘录");
        memoDao.deleteMemo(studentid, createtime);
    }
    
    public List<Memo> QueryHomeMemoById(String studentid){
        logger.info("获取首页备忘录");
        return memoDao.QueryHomeMemoById(studentid);
    }
}
