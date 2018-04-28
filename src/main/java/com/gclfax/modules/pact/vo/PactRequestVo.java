package com.gclfax.modules.pact.vo;

import java.io.Serializable;

/**
 * Create by qinsen on 2018/04/28
 */
public class PactRequestVo implements Serializable{
    private static final long serialVersionUID = 7802335362608115448L;

    /** 平台标识 */
    private String platform;
    /** 合同模板版本号 */
    private Long pactVersionId;
    /** 业务类型 "bidId"\"investId"\"o2mBidId" */
    private String pactFlag;
     /** 业务主键 */
    private Long businessId;
    /** 转让标用户id */
    private Long o2mUserId;

    public Long getPactVersionId() {
        return pactVersionId;
    }

    public void setPactVersionId(Long pactVersionId) {
        this.pactVersionId = pactVersionId;
    }

    public Long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getPactFlag() {
        return pactFlag;
    }

    public void setPactFlag(String pactFlag) {
        this.pactFlag = pactFlag;
    }

    public Long getO2mUserId() {
        return o2mUserId;
    }

    public void setO2mUserId(Long o2mUserId) {
        this.o2mUserId = o2mUserId;
    }
}
