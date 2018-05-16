package com.gclfax.modules.pact.entity;

import java.util.Date;

public class PactRecordEntity {
    private Long id;

    private String platform;

    private Long businessId;

    private Long investId;

    private String pactFlag;

    private String pactPath;

    private Date createTime;

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

    public Long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }

    public String getPactFlag() {
        return pactFlag;
    }

    public void setPactFlag(String pactFlag) {
        this.pactFlag = pactFlag;
    }

    public Long getInvestId() {
        return investId;
    }

    public void setInvestId(Long investId) {
        this.investId = investId;
    }
}