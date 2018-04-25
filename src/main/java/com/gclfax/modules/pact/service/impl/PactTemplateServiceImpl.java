package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactTemplateDao;
import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@Service
public class PactTemplateServiceImpl implements PactTemplateService {

    @Autowired
    private PactTemplateDao pactTemplateDao;

    @Override
    public void save(PactTemplateEntity pactTemplate) {
        pactTemplateDao.save(pactTemplate);
    }

    @Override
    public int update(Map<String, Object> map) {
        return pactTemplateDao.update(map);
    }
}
