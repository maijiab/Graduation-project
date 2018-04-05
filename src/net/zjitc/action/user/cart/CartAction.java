package net.zjitc.action.user.cart;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.zjitc.domain.cart.Cart;
import net.zjitc.domain.cart.CartItem;
import net.zjitc.domain.user.User;
import net.zjitc.service.product.ProductService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/12/9.
 */
@Controller
@Scope("prototype")
public class CartAction extends ActionSupport{
    @Resource
    private ProductService productService;
    private Integer pid;
    private Integer count;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String addCart(){
        User existUser = (User) ActionContext.getContext().getSession().get("existUser");
        if (existUser == null){
            return "login";
        }
        CartItem cartItem = new CartItem();
        cartItem.setCount(count);
        cartItem.setProduct(productService.findByPdid(pid));
        /*把新的item放入到购物车*/
        Cart cart = getCart();
        cart.addCart(cartItem);
        return "cart";
    }
    public String removeCart(){
        Cart cart = getCart();
        cart.removeItem(pid);
        return "cart";
    }

    public String clearCart(){
        Cart cart = getCart();
        cart.clearCart();
        return "cart";
    }

    public String findCart(){

        User existUser = (User) ActionContext.getContext().getSession().get("existUser");
        if (existUser == null){
            return "login";
        }
        return "cart";
    }


    public Cart getCart() {
        Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
        if (cart == null){
            cart = new Cart();
            ActionContext.getContext().getSession().put("cart",cart);
        }
        return cart;
    }
}
