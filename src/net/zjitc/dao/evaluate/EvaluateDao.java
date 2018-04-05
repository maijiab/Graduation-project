package net.zjitc.dao.evaluate;

import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.utils.PageBean;

import java.util.List;

/**
 * Created by fyl1997 on 2017/12/20.
 */
public interface EvaluateDao {
    void save(Evaluate evaluate);

    PageBean<Evaluate> findPageBean(int page, int limit);

    List<Evaluate> findAll();

    Evaluate getById(int eid);

    void delete(Evaluate eva);
}
