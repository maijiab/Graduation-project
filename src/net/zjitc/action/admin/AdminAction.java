package net.zjitc.action.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.admin.Admin;
import net.zjitc.domain.user.User;
import net.zjitc.service.admin.AdminService;
import net.zjitc.service.user.UserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/20.
 */
@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport implements ModelDriven<Admin> {
    private Admin model=new Admin();

    @Resource
    public AdminService adminService;

    @Resource
    public UserService userService;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    private Integer uid;

    public String loginUI(){
        return "loginUI";
    }

    public String login(){
        Admin existAdmin=adminService.findByUsernamePassword(model.getUsername(),model.getPassword());
        if(existAdmin==null){
             addActionError("用户名或密码错误");
             return "loginFail";
        }
        ActionContext.getContext().getSession().put("existAdmin",existAdmin);
        return "loginSuccess";
    }
    @Override
    public Admin getModel() {
        return model;
    }

    public String findAllUser(){
       List<User> userList=userService.findAllUser();
       ActionContext.getContext().put("userList",userList);
       return "findAllUser";
    }
    /**
     * 删除当前用户
     * @return
     */
    public String deleteUser(){
     User user= userService.getById(uid);
        //再删除用户
     userService.delete(user);
        return "deleteUser";
    }
}
