package net.zjitc.service.admin;

import net.zjitc.domain.admin.Admin;

/**
 * Created by fyl1997 on 2017/11/20.
 */
public interface AdminService {
    Admin findByUsernamePassword(String username, String password);
}
