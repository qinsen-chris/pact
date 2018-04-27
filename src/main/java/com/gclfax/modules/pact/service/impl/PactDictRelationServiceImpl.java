package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactDictRelationDao;
import com.gclfax.modules.pact.entity.PactDictRelationEntity;
import com.gclfax.modules.pact.service.PactDictRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@Service
public class PactDictRelationServiceImpl implements PactDictRelationService {

    @Autowired
    private PactDictRelationDao pactDictRelationDao;

    @Override
    public void save(PactDictRelationEntity pactDictRelationEntity) {
        pactDictRelationDao.save(pactDictRelationEntity);
    }

    @Override
    public int update(PactDictRelationEntity pactDictRelationEntity) {
        return pactDictRelationDao.update(pactDictRelationEntity);
    }

    @Override
    public int deleteBatch(Long[] pactIds) {
        return pactDictRelationDao.deleteBatch(pactIds);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return pactDictRelationDao.queryTotal();
    }

    @Override
    public List<PactDictRelationEntity> queryList(Map<String, Object> map) {
        return pactDictRelationDao.queryList(map);
    }

    @Override
    public List<Map<String, Object>> queryPactDictRelationList(Map<String, Object> map) {
        return pactDictRelationDao.queryPactDictRelationList(map);
    }
}
