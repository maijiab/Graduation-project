package net.zjitc.action.admin.product;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.categorysecond.Categorysecond;
import net.zjitc.domain.product.Product;
import net.zjitc.service.categorysecond.CategorySecondService;
import net.zjitc.service.product.ProductService;
import net.zjitc.utils.PageBean;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/29.
 */
@Controller
@Scope("prototype")
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
        private Product model=new Product();


        public Integer getPage() {
            return page;
        }

        public void setPage(Integer page) {
            this.page = page;
        }

        public Integer getLimit() {
            return limit;
        }

        public void setLimit(Integer limit) {
            this.limit = limit;
        }

        //需要设置两个页面传过来的参数 setter/getter
        private Integer page;
        private Integer limit = 7;

        private File upload;
        private String pname;
        private String str;
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    private String uploadFileName;

    @Resource
        private ProductService productService;
        @Resource
        private CategorySecondService categorySecondService;

        public String findAll(){
            List plist=productService.findAll();
            ActionContext.getContext().put("plist",plist);
            return "list";
        }

        public String findPage(){
            PageBean<Product> pageBean=productService.findPage(page,limit);
            ActionContext.getContext().getValueStack().push(pageBean);
            return "list";
        }

        public String addUI(){
            List<Categorysecond> cslist=categorySecondService.findAll();
            ActionContext.getContext().put("cslist",cslist);
            return "addUI";
        }
        public String add(){
            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            model.setPdate(timestamp);
            String realPath= ServletActionContext.getServletContext().getRealPath("/products/3");
              if(upload!=null){
               File file=new File(new File(realPath),uploadFileName);
               try {
                   FileUtils.copyFile(upload,file);
                   model.setImage("products/3/"+uploadFileName);
                   productService.save(model);
               } catch (IOException e) {
                   e.printStackTrace();
               }
           }
            return "tolist";
        }
        public String editUI(){
            Product product=productService.findByPdid(model.getPid());
            ActionContext.getContext().getValueStack().push(product);
            List<Categorysecond> cslist=categorySecondService.findAll();
            ActionContext.getContext().put("cslist",cslist);
            return "editUI";
        }
        public String edit(){
            Product product = productService.findByPdid(model.getPid());
            String oldPath = product.getImage();
            if (oldPath!=null){
                oldPath=ServletActionContext.getServletContext().getRealPath(oldPath);
                File oldFile=new File(oldPath);
                if(oldFile.exists()){
                    oldFile.delete();
                }}
                String realPath = ServletActionContext.getServletContext().getRealPath("/products/3");
                if (upload != null){
                    File file = new File(new File(realPath),uploadFileName);
                    try {
                        FileUtils.copyFile(upload,file);
                        model.setImage("products/3/"+uploadFileName);
                    } catch (IOException e){
                        e.printStackTrace();
                    }
                }
            productService.update(model);
                 return "tolist";
        }

        public String query() {
            List list=productService.query(model.getPname());
            ActionContext.getContext().put("list",list);
            return "queryList";
        }
    public String findPages(){
        PageBean<Product> pageBean=productService.findPages(page,limit,model.getPname());
        ActionContext.getContext().getValueStack().push(pageBean);
        return "queryList";
    }
        public String delete(){
            HttpServletRequest request = ServletActionContext.getRequest();
            String[] strArr= str.split(",");
            for (int i=1;i<strArr.length;i++){
                Integer id = Integer.valueOf(strArr[i]);
                Product product = productService.findByPdid(id);
                productService.delete(product);
            }
            return "tolist";
        }
        @Override
        public Product getModel() {
            return model;
        }
    }


