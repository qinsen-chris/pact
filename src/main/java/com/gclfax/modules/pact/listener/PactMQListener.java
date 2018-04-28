package com.gclfax.modules.pact.listener;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gclfax.modules.pact.service.PactRecordService;
import com.gclfax.modules.pact.vo.PactRequestVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Service;

/**
 * Create by qinsen on 2018/4/28
 */
@Service
public class PactMQListener {
    private static final Logger LOGGER = LoggerFactory.getLogger(PactMQListener.class);
    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private PactRecordService pactRecordService;

    @JmsListener(destination = "gxs_cg.pact")
    public void receivePactQueue(String text) {
        LOGGER.info("队列{}，接收到报文{}", "gxs_cg.pact",text);
        try {
            Thread.sleep(1000);
            PactRequestVo vo = mapper.readValue(text, PactRequestVo.class);
            pactRecordService.pactRecordService(vo.getPlatform(),vo.getPactFlag(),vo.getBusinessId(),vo.getPactVersionId(), vo.getO2mUserId());

        } catch (Exception e) {
            LOGGER.error("接收报文格式异常{}",text, e);
        }
    }
}
