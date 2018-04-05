package net.zjitc.action.admin.evaluate;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.service.evaluate.EvaluateService;
import net.zjitc.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/12/21.
 */
@Controller
@Scope("prototype")
public class AdminEvaluateAction extends ActionSupport implements ModelDriven<Evaluate> {

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    private int page;//接收当前页
    private int limit = 10;//限定limit为10条数据
    private int eid;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    private int oid;

    @Resource
    private EvaluateService evaluateService;
    public String findAll(){
        List<Evaluate> elist=evaluateService.findAll();
        ActionContext.getContext().put("elist",elist);
        return "list";
    }

    public String findPageBean(){
        PageBean<Evaluate> pageBean = evaluateService.findPageBean(page,limit);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "list";
    }
    public String delete(){
        Evaluate eva=evaluateService.getById(model.getEid());
        evaluateService.delete(eva);
        return "evaluateList";
    }


    private Evaluate model = new Evaluate();
    @Override
    public Evaluate getModel() {
        return model;
    }
}
