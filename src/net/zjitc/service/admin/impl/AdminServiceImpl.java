package net.zjitc.service.admin.impl;

import net.zjitc.dao.admin.AdminDao;

import net.zjitc.domain.admin.Admin;
import net.zjitc.service.admin.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/11/20.
 */
@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Resource
    public AdminDao adminDao;
    @Override
    public Admin findByUsernamePassword(String username, String password) {
        return adminDao.findByUsernamePassword(username,password);
    }
}
