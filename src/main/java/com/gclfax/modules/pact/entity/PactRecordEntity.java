package com.gclfax.modules.pact.entity;

import java.util.Date;

public class PactRecordEntity {
    private Long id;

    private String platform;

    private String fileSign;

    private String pactPath;

    private Date createTime;

    private Integer version;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform == null ? null : platform.trim();
    }

    public String getFileSign() {
        return fileSign;
    }

    public void setFileSign(String fileSign) {
        this.fileSign = fileSign == null ? null : fileSign.trim();
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

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}