package net.zjitc.service.evaluate.impl;

import net.zjitc.dao.evaluate.EvaluateDao;
import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.service.evaluate.EvaluateService;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Service
@Transactional
public class EvaluateServiceImpl implements EvaluateService{
    @Resource
    private EvaluateDao evaluateDao;
    @Override
    public void save(Evaluate evaluate){
        evaluateDao.save(evaluate);
    }

    @Override
    public PageBean<Evaluate> findPageBean(int page, int limit) {
        return evaluateDao.findPageBean(page,limit);
    }

    @Override
    public List<Evaluate> findAll() {
        return evaluateDao.findAll();
    }

    @Override
    public Evaluate getById(int eid) {
        return evaluateDao.getById(eid);
    }

    @Override
    public void delete(Evaluate eva) {
        evaluateDao.delete(eva);
    }
}
