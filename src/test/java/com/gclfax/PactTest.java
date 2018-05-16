package com.gclfax;

import com.gclfax.common.constants.PactFlagEnum;
import com.gclfax.common.constants.PlatformEnum;
import com.gclfax.modules.pact.entity.PactRecordEntity;
import com.gclfax.modules.pact.entity.PactVersionEntity;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.service.PactTemplateService;
import com.gclfax.modules.pact.service.PactVersionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by chenmy on 2018/4/30.
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
    @Autowired
    private PactTemplateService pactTemplateService;


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
        PactRecordEntity pactRecord = new PactRecordEntity();
        pactRecord.setPlatform(PlatformEnum.GXS_CG.getCode());
        pactRecord.setPactFlag("bid");

        Map<String, Object> map = pactRecordService.queryPactPath(pactRecord);
        System.out.println(map);
    }

    @Test
    public void testJdbcTemplate(){
        String s = jdbcTemplate.queryForObject("select name from xiaofeng.t_users where id = ?", String.class, 10026);
        System.out.println(s);
    }

    @Test
    public void testPactRecordService(){
        Map<String, Object> map = pactRecordService.pactRecordService(PlatformEnum.GXS_CG.getCode(), "201805", PactFlagEnum.BID.getCode(), 1000045L,10L);
        System.out.println(map.toString());
    }

    @Test
    public void testPactNo(){
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("platform","gxs_cg");
        paramsMap.put("fileDate","201809");
        paramsMap.put("pactFlag","bid");
        paramsMap.put("businessId",1234567);
        paramsMap.put("pactVersionId",13);

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("contractNo", "KKKKKKKK-001");
        params.put("firstParty", "中国人民解放军");
        params.put("firstPartyBusinessLicenseNumber", "00000000001");
        params.put("secondParty", "888.00");
        params.put("aa", "yyyyyyyyyyy");
        paramsMap.put("replaceMap",params);


        Map<String, Object> map = pactRecordService.pactCreate(paramsMap);
        System.out.println("=============================: "+map);
    }

    @Test
    public void testpactTemplateService(){
        Map<String,Object> paramMap = new HashMap();
        paramMap.put("platform","gxs_cg");
        List<Map<String, Object>> maps = pactTemplateService.queryPactTemplate(paramMap);
        System.out.println("=============="+maps.toString());
    }
}
