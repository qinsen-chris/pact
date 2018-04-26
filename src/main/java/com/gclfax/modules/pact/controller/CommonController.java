package com.gclfax.modules.pact.controller;

import com.gclfax.common.constants.PlatformEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gclfax.common.utils.R;
import com.gclfax.common.validator.Assert;
import com.gclfax.modules.pact.service.CommonService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.ArrayList;
import java.util.List;

/**
 * 活动平台公共接口
 * @author chenwenjie
 *
 */
@RestController
@RequestMapping("/common")
@Api("活动公共登录接口")
public class CommonController {
	
	
	private static final Logger log = LoggerFactory.getLogger(CommonController.class);

	
	@Autowired
	private CommonService commonService;
	
	@PostMapping("shareBack")
	@ApiOperation("用户分享回调")
	public R shareCallBack(Long activityId, String equipId, Long userId){
		
		Assert.isNull(activityId, "活动id不能为空");
		Assert.isBlank(equipId, "设置标识不能为空");
		
		log.info("用户user{}分享活动{}", userId, equipId, activityId);
		commonService.shareCallBack(activityId, equipId, userId);
		
		return R.ok();
	}

	/**
	 * 获取平台列表
	 * @return
	 */
	@RequestMapping("/platformList")
	public R platformList(){
		List<String> platformList = new ArrayList<String>();
		platformList.add(PlatformEnum.GXS_CG.getCode());
		platformList.add(PlatformEnum.GXS_HF.getCode());

		R r =  R.ok();
		r.put("platformEnum",platformList);
		return r;
	}
}
