package com.gclfax.modules.pact.entity;

/**
 * Created by chenmy on 2018/5/3.
 */
public class RelationGenerateTypeEntity {
    private Long id;
    private Long relationId;
    private Boolean bid;
    private Boolean o2mBid;
    private Boolean invest;
    private Boolean o2mInvest;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRelationId() {
        return relationId;
    }

    public void setRelationId(Long relationId) {
        this.relationId = relationId;
    }

    public Boolean getBid() {
        return bid;
    }

    public void setBid(Boolean bid) {
        this.bid = bid;
    }

    public Boolean getO2mBid() {
        return o2mBid;
    }

    public void setO2mBid(Boolean o2mBid) {
        this.o2mBid = o2mBid;
    }

    public Boolean getInvest() {
        return invest;
    }

    public void setInvest(Boolean invest) {
        this.invest = invest;
    }

    public Boolean getO2mInvest() {
        return o2mInvest;
    }

    public void setO2mInvest(Boolean o2mInvest) {
        this.o2mInvest = o2mInvest;
    }
}
