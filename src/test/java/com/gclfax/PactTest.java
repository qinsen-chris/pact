package com.gclfax;

import com.gclfax.common.constants.PactFlagEnum;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactVersionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
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
    @Autowired
    private PactRecordService pactRecordService;
    @Autowired
    private JdbcTemplate jdbcTemplate;

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

    @Test
    public void testPactPath(){
        Map<String, Object> map = pactRecordService.queryPactPath(PlatformEnum.GXS_CG.getCode(), "bid", 1L);
        System.out.println(map);
    }

    @Test
    public void testJdbcTemplate(){
        String s = jdbcTemplate.queryForObject("select name from xiaofeng.t_bids where id = ?", String.class, 10026);
        System.out.println(s);
    }

    @Test
    public void testPactRecordService(){
        pactRecordService.pactRecordService(PlatformEnum.GXS_CG.getCode(),"201805", PactFlagEnum.BID.getCode(), 1000043L,9L);
    }



}
