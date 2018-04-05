package net.zjitc.dao.admin;

import net.zjitc.domain.admin.Admin;

/**
 * Created by fyl1997 on 2017/11/24.
 */
public interface AdminDao {
    Admin findByUsernamePassword(String username, String password);
}
