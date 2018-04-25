package com.gclfax;

import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactVersionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/25.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class PactTest {

    @Autowired
    private PactVersionService pactVersionService;

    @Test
    public void testPactVersionService(){
        PactVersionEntity entity = new PactVersionEntity();
        entity.setPactPath("asifghlsdfjgoiaur");
        entity.setCreateTime(new Date());
        entity.setPactTemplateId(11L);
        pactVersionService.save(entity);

        entity = pactVersionService.findById(1L);
        System.out.println("PactVersionService : "+entity);
    }

    @Test
    public void testgetMapById(){
        Map map = pactVersionService.getMapById(1L);
        System.out.println("PactVersionService : MAP ="+map);
    }
}
