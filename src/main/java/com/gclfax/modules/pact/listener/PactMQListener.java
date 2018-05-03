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

    /**
     * 根据类型和业务id生成合同
     * @param text
     */
    @JmsListener(destination = "pact.cg")
    public void receivePactQueue(String text) {
        LOGGER.info("队列{}，接收到报文{}", "pact.cg",text);
        try {
            Thread.sleep(1000);
            PactRequestVo vo = mapper.readValue(text, PactRequestVo.class);
            pactRecordService.pactRecordService(vo.getPlatform(),vo.getFileDate(),vo.getPactFlag(),vo.getBusinessId(),vo.getPactVersionId(),0);

        } catch (Exception e) {
            LOGGER.error("接收报文格式异常{}",text, e);
        }
    }

    /**
     * 生成转让标合同 （类型、业务id、转让人）
     * @param text
     */
    @JmsListener(destination = "pact.cg_o2m")
    public void receivePactQueueO2M(String text) {
        LOGGER.info("队列{}，接收到报文{}", "pact.cg_o2m",text);
        try {
            Thread.sleep(1000);
            PactRequestVo vo = mapper.readValue(text, PactRequestVo.class);
            pactRecordService.pactGenerateO2M(vo.getPlatform(),vo.getFileDate(),vo.getPactFlag(),vo.getBusinessId(),vo.getPactVersionId(), vo.getO2mUserId());

        } catch (Exception e) {
            LOGGER.error("接收报文格式异常{}",text, e);
        }
    }
}
