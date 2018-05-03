package com.gclfax.modules.pact.service.impl;

import com.gclfax.modules.pact.dao.RelationGenerateTypeDao;
import com.gclfax.modules.pact.entity.RelationGenerateTypeEntity;
import com.gclfax.modules.pact.service.RelationGenerateTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/5/3.
 */
@Service
public class RelationGenerateTypeServiceImpl implements RelationGenerateTypeService {

    @Autowired
    private RelationGenerateTypeDao relationDao;

    @Override
    public void save(RelationGenerateTypeEntity relationGenerateTypeEntity) {
        relationDao.save(relationGenerateTypeEntity);
    }

    @Override
    public int update(RelationGenerateTypeEntity relationGenerateTypeEntity) {
        return relationDao.update(relationGenerateTypeEntity);
    }

    @Override
    public int deleteBatch(Long[] ids) {
        return relationDao.deleteBatch(ids);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return relationDao.queryTotal(map);
    }

    @Override
    public List<Map<String, Object>> queryMapList(Map<String, Object> map) {
        return relationDao.queryMapList(map);
    }
}
