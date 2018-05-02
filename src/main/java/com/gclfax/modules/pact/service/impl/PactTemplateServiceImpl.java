package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactTemplateDao;
import com.gclfax.modules.pact.entity.PactTemplateEntity;
import com.gclfax.modules.pact.service.PactTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
    public int update(PactTemplateEntity pactTemplate) {
        return pactTemplateDao.update(pactTemplate);
    }

    @Override
    public List<PactTemplateEntity> queryList(Map<String, Object> map) {
        return pactTemplateDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return pactTemplateDao.queryTotal(map);
    }

    @Override
    public PactTemplateEntity queryObject(Long pactId) {
        return pactTemplateDao.queryObject(pactId);
    }

    @Override
    public int deleteBatch(Long[] pactIds) {
        return pactTemplateDao.deleteBatch(pactIds);
    }

    @Override
    public List<Map<String, Object>> queryPactTemplate(Map<String, Object> map) {
        return pactTemplateDao.queryPactTemplate(map);
    }

    @Override
    public int queryTotalTemp(Map<String, Object> map) {
        return pactTemplateDao.queryTotalTemp(map);
    }
}
