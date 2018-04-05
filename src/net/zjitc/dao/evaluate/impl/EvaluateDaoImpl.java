package net.zjitc.dao.evaluate.impl;

import net.zjitc.dao.base.SessionBase;
import net.zjitc.dao.evaluate.EvaluateDao;
import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Repository
public class EvaluateDaoImpl extends SessionBase implements EvaluateDao {
    @Override
    public void save(Evaluate evaluate) {
        getSession().save(evaluate);
    }

    @Override
    public PageBean<Evaluate> findPageBean(int page, int limit) {
        //从数据库中查出数据
        List<Evaluate> list= this.getSession().createQuery(
                "from Evaluate order by data desc ")
                .setFirstResult((page - 1) * limit)
                .setMaxResults(limit)
                .list();
        //查出总记录
        Long count = (Long) this.getSession().createQuery(
                "select count (*) from Evaluate ")
                .uniqueResult();
        //生成pageBean对象
        return new PageBean<Evaluate>(page, limit, count.intValue(), list);
    }

    @Override
    public List<Evaluate> findAll() {
        return getSession().createQuery("from Evaluate")
                .list();
    }

    @Override
    public Evaluate getById(int eid) {
        return (Evaluate) getSession().createQuery("from Evaluate e where e.eid=?")
                .setParameter(0,eid)
                .uniqueResult();
    }

    @Override
    public void delete(Evaluate eva) {
    getSession().delete(eva);
    }
}
