package net.zjitc.domain.cart;

import net.zjitc.domain.product.Product;
import net.zjitc.domain.user.User;

/**
 * Created by fyl1997 on 2017/12/9.
 */
public class CartItem {
    private Product product; //产品
        private Integer count; //数量
        private Double subTotal;//小计
        private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
            return product;
        }

        public void setProduct(Product product) {
            this.product = product;
        }

        public Integer getCount() {
            return count;
        }

        public void setCount(Integer count) {
            this.count = count;
        }

        public Double getSubTotal() {
            return this.product.getPrice()*this.count;
        }

        public void setSubTotal(Double subTotal) {
            this.subTotal = subTotal;
        }
    }


