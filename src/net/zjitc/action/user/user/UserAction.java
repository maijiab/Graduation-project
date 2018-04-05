package net.zjitc.action.user.user;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.user.User;
import net.zjitc.service.user.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by fyl1997 on 2017/12/6.
 */
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
    private User model=new User();
    private String phone;
    private String email;
    private String password;
    private String username;
    private String repassword;


    public String getValidatecode() {
        return validatecode;
    }

    public void setValidatecode(String validatecode) {
        this.validatecode = validatecode;
    }

    private String validatecode; //接收验证码
    @Resource
    private UserService userService;

    public UserAction() {
    }

    public String registUI(){

        return "registUI";
    }

    public String regist(){
        String truecode = (String) ActionContext.getContext().getSession().get("validateCode");
        System.out.println("code ==="+truecode);
        if(!truecode.equalsIgnoreCase(validatecode)){
            this.addFieldError("logincodefail", "验证码错误");
            return "registUI";
        }
        //取表单repassword的值
        String repassword=getRepassword();
        //取表单passwords的值
        String password= model.getPassword();
        if (!repassword.equals(password)){
            return "registUI";
        }
        userService.save(model);
        return "registSuccess";
    }
    public String findByUsername() throws IOException {
        User u = userService.findByUsername(model.getUsername());
        /*获取响应，向页面输出内容*/
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        if (u != null){
            //响应用户名已经存在
            response.getWriter().print(false);
        }else {
            response.getWriter().print(true);
        }
        return NONE;
    }

     public String loginUI() {
        return "loginUI";
     }
     public String login(){
             String truecode = (String) ActionContext.getContext().getSession().get("validateCode");
             System.out.println("code ==="+truecode);
             if(!truecode.equalsIgnoreCase(validatecode)){
                 this.addFieldError("logincodefail", "验证码错误");
                 return "loginUI";
             }
             User existUser = userService.findByUsernamePassword(model.getUsername(),model.getPassword());
             if (existUser == null ){
                 this.addActionMessage("用户名或密码错误");
                 return "loginUI";
             }
          ActionContext.getContext().getSession().put("existUser",existUser);
          return "loginSuccess";
     }
    public String loginOut(){
       ActionContext.getContext().getSession().remove("existUser");
        return "loginOut";
    }

    @Override
    public User getModel() {
        return model;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getRepassword() {
        return repassword;
    }
}
