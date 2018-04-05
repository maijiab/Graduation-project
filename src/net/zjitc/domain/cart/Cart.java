package net.zjitc.domain.cart;

import com.opensymphony.xwork2.ActionContext;
import net.zjitc.domain.user.User;

import java.util.Collection;
import java.util.LinkedHashMap;

/**
 * Created by fyl1997 on 2017/12/9.
 */
public class Cart {
    /*购物车由多个条目构成，所以应该是一个集合
       * 问题一：用个什么样的集合？
       * 因为想查询单个条目的时候，使用一个id进行查询对应的记录比较方便，
       * 所以可以使用map集合（key,value）--(pid, cartitem)
       * 问题二：购物车显示的顺序是怎么样的？？
       * 按一定的顺序显示--->显示的时候是先添加的显示在前面，后添加的在后面，
       * 那么有个 LinkedHashMap 可以满足以上的显示顺序，
       * 故使用 LinkedHashMap 对象不 来 装cartitem购物车条目
       * */
    private LinkedHashMap<Integer,CartItem> map = new LinkedHashMap<>();
    private Double total = 0.0; //总计v null
    private User user;
    /*private CartItem*/

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /*准备四个方法 */
    //1. 增加
    public void addCart(CartItem item){


        /*先判断是否已经有这个商品*/
        Integer pid = item.getProduct().getPid();
        if (map.containsKey(pid)){//判断是否含有此商品

            //从map集合中取出当前商品ID的记录，修改里面的数量
            CartItem preItem = map.get(pid);
            preItem.setCount(preItem.getCount()+item.getCount());//数量应该由原数量+新条目的数量

        }else { //map里没有新添加的商品，商品放进来就好了
            map.put(pid,item);
        }
        //计算总价
        total = total + item.getSubTotal();

    }
    //2.删除
    public void removeItem(Integer pid){
        //移除当前pid对应的item,会返回被移除的item
        CartItem item = map.remove(pid);
        /*总价 = 原总价 - 移除的item的小计*/
        total = total - item.getSubTotal();
    }
    //3.清空
    public void clearCart(){
        //清空map集合
        map.clear();
        //总价为空
        total = 0.0;
    }
    //4.查询
    // 页面显示的时候只显示了条目，所以只需要从map集合中取出对应的value便可
    //如果全部取出，则需要另个的处理
    /* 为页面提供的 getXxxx方法 */
    public Collection<CartItem> getCartItems(){
        return map.values();
    }

    public LinkedHashMap<Integer, CartItem> getMap() {
        return map;
    }

    public void setMap(LinkedHashMap<Integer, CartItem> map) {
        this.map = map;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
