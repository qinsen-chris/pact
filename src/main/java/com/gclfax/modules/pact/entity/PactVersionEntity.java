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
}