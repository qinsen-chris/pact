package com.gclfax.modules.pact.entity;

import java.util.Date;

/**
 * 协议版本
 */
public class PactVersionEntity {
    private Long id;

    private String pactPath;

    private Date createTime;

    private Long pactTemplateId;

    private String pactName;

    private int version;

    private String name;

    private String platform;

    private String params;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPactPath() {
        return pactPath;
    }

    public void setPactPath(String pactPath) {
        this.pactPath = pactPath == null ? null : pactPath.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getPactTemplateId() {
        return pactTemplateId;
    }

    public void setPactTemplateId(Long pactTemplateId) {
        this.pactTemplateId = pactTemplateId;
    }

    public String getPactName() {
        return pactName;
    }

    public void setPactName(String pactName) {
        this.pactName = pactName;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }
}