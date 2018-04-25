package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactTemplateEntity;

import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
public interface PactTemplateService {

    void save(PactTemplateEntity pactTemplate);

    int update(Map<String, Object> map);
}
