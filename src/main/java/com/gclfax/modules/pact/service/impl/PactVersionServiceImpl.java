package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactVersionDao;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactVersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@Service
public class PactVersionServiceImpl implements PactVersionService {

    @Autowired
    private PactVersionDao pactVersionDao;

    @Override
    public void save(PactVersionEntity pactVersionEntity) {
        pactVersionDao.save(pactVersionEntity);
    }

    @Override
    public PactVersionEntity findById(Long id) {
        return pactVersionDao.queryObject(id);
    }

    @Override
    public Map getMapById(Long id) {
        return pactVersionDao.getMapById(id);
    }
}
