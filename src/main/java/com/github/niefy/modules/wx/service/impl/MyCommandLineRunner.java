package com.github.niefy.modules.wx.service.impl;

import com.github.niefy.modules.wx.service.WxAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(Integer.MAX_VALUE)
public class MyCommandLineRunner implements CommandLineRunner {

    @Autowired
    private WxAccountService wxAccountService;

    @Override
    public void run(String... args) throws Exception {
        // 在系统启动后执行的逻辑
        try {
            wxAccountService.loadWxMpConfigStorages();
        } catch (Exception exception) {

        }
    }
}
