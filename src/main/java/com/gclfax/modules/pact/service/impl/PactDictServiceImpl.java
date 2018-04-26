package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactDictDao;
import com.gclfax.modules.pact.entity.PactDictEntity;
import com.gclfax.modules.pact.service.PactDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@Service
public class PactDictServiceImpl implements PactDictService {

    @Autowired
    private PactDictDao pactDictDao;

    @Override
    public void save(PactDictEntity pactDictEntity) {
        pactDictDao.save(pactDictEntity);
    }

    @Override
    public int update(PactDictEntity pactDictEntity) {
        return pactDictDao.update(pactDictEntity);
    }

    @Override
    public int deleteBatch(Long[] pactIds) {
        return pactDictDao.deleteBatch(pactIds);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return pactDictDao.queryTotal();
    }

    @Override
    public List<PactDictEntity> queryList(Map<String, Object> map) {
        return pactDictDao.queryList(map);
    }
}
