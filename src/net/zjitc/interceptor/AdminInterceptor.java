package net.zjitc.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import net.zjitc.domain.admin.Admin;
import org.springframework.stereotype.Component;

/**
 * Created by fyl1997 on 2017/11/24.
 */
@Component
public class AdminInterceptor implements Interceptor {

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        Admin admin= (Admin) ActionContext.getContext().getSession().get("existAdmin");
        if(admin==null){
            return "nologin";
        }else{
            return  actionInvocation.invoke();
        }

    }
}
