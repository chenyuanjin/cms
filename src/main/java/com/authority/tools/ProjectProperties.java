package com.authority.tools;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;

/**
 * Created by chenyuanjin on 15/7/7.
 * 这个类可以使用Spring加载自定义配置
 */
@Component
public class ProjectProperties {

    public static String FILE_PATH;
    public static String FILE_SERVER;

    private String filePath;
    private String fileServer;

    public void init() {
        FILE_PATH = filePath;
        FILE_SERVER = fileServer;
    }

    public String getFilePath() {
        return filePath;
    }

    @Required
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileServer() {
        return fileServer;
    }

    @Required
    public void setFileServer(String fileServer) {
        this.fileServer = fileServer;
    }
}


