package com.github.niefy;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import javax.sql.DataSource;
import java.io.File;

@Configuration
public class CustomizeDataSourceInitializer {

    @Value("classpath:db/schema.sql")
    private Resource sqlScriptSchema;

    @Value("${spring.datasource.url}")
    private String dataSourceUrl;

    @Bean
    public DataSourceInitializer dataSourceInitializer(final DataSource dataSource) {
        DataSourceInitializer dataSourceInitializer = new DataSourceInitializer();
        dataSourceInitializer.setDataSource(dataSource);
        dataSourceInitializer.setDatabasePopulator(databasePopulator());
        return dataSourceInitializer;
    }

    private DatabasePopulator databasePopulator() {
        ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
        // 检测文件是否存在 jdbc:h2:file:C:/Users/qing/Downloads/tduck-wx-manage1/wx_manage file:之后的
        String url = StrUtil.sub(dataSourceUrl, 13, dataSourceUrl.length());
        // 相对目录替换成绝对的目录
        ApplicationHome h = new ApplicationHome(getClass());
        url = url.replace("./", h.getSource().getParent() + File.separator);
        if (!FileUtil.exist(url + ".mv.db")) {
            populator.addScript(sqlScriptSchema);
        }
        return populator;
    }
}
