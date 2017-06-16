package com.hutianyi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hutianyi.bean.T_MALL_PRODUCT;
import com.hutianyi.service.SpuServiceImpl;
import com.hutianyi.utils.MyUploadUtils;

@Controller
public class SpuController {
	
	@Autowired
	SpuServiceImpl spuServiceImpl;
	
	@RequestMapping(value="spu_publish",method = RequestMethod.POST)
	public String spu_publish(T_MALL_PRODUCT spu,@RequestParam("files")MultipartFile[] files ) {
		//将图片上传到服务器的指定方法
		List<String> images_name = MyUploadUtils.upload_img(files);
		
		//调用业务层的商品发布的增删改查
		int i = spuServiceImpl.spu_pulish(spu,images_name);
		
		return "manager_spu_publish";
	}
	
	@RequestMapping("goto_spu_publish")
	public String goto_spu_publish() {
		
		return "manager_spu_publish";
		
	}

}
