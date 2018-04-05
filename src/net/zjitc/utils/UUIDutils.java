package net.zjitc.utils;

import java.util.UUID;

/**
 * Created by fyl1997 on 2017/12/7.
 */
public class UUIDutils {
    public static String uuid(){
        return UUID.randomUUID().toString().replace("-","");
    }
}
