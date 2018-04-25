package com.gclfax.modules.pact.service;

import com.gclfax.modules.pact.entity.PactVersionEntity;

import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
public interface PactVersionService {

    void save(PactVersionEntity pactVersionEntity);

    PactVersionEntity findById(Long id);

    Map getMapById(Long id);
}
