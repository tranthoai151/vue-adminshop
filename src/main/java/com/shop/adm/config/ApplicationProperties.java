package com.shop.adm.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Properties specific to Shopdmin.
 * <p>
 * Properties are configured in the {@code application.yml} file.
 * See {@link io.github.jhipster.config.JHipsterProperties} for a good example.
 */
@ConfigurationProperties(prefix = "application", ignoreUnknownFields = false)
public class ApplicationProperties {
    private String docdb;

    public String getDocdb() {
        return docdb;
    }
    public void setDocdb(String docdb) {
        this.docdb = docdb;
    }
}
