package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.PactVersionDao;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactVersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
    public int update(PactVersionEntity pactVersionEntity) {
        return pactVersionDao.update(pactVersionEntity);
    }

    @Override
    public PactVersionEntity findById(Long id) {
        return pactVersionDao.queryObject(id);
    }

    @Override
    public PactVersionEntity findByTemplateId(Long templateId) {
        return pactVersionDao.findByTemplateId(templateId);
    }

    @Override
    public Map getMapById(Long id) {
        return pactVersionDao.getMapById(id);
    }

    /**
     * 查询列表
     *
     * @param map
     * @return
     */
    @Override
    public List<PactVersionEntity> queryList(Map<String, Object> map) {
        return pactVersionDao.queryList(map);
    }

    /**
     * 查询总数
     *
     * @param map
     */
    @Override
    public int queryTotal(Map<String, Object> map) {
        return pactVersionDao.queryTotal(map);
    }

    @Override
    public int selectMaxVersionByParam(Map<String, Object> map) {
        return pactVersionDao.selectMaxVersionByParam(map);
    }
}
