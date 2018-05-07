package com.gclfax.modules.pact.entity;

public class PactDictRelationEntity {
    private Long id;

    private Long pactTemplateId;

    private Long pactDictId;

    private String resultType;

    private Boolean isMust;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPactTemplateId() {
        return pactTemplateId;
    }

    public void setPactTemplateId(Long pactTemplateId) {
        this.pactTemplateId = pactTemplateId;
    }

    public Long getPactDictId() {
        return pactDictId;
    }

    public void setPactDictId(Long pactDictId) {
        this.pactDictId = pactDictId;
    }

    public String getResultType() {
        return resultType;
    }

    public void setResultType(String resultType) {
        this.resultType = resultType;
    }

    public Boolean getMust() {
        return isMust;
    }

    public void setMust(Boolean must) {
        this.isMust = must;
    }
}