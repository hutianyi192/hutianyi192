package com.hutianyi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hutianyi.bean.T_MALL_SHOPPINGCAR;
import com.hutianyi.bean.T_MALL_VALUE;

@Controller
public class ShoppingCarController {
	
	@Autowired
//	ShoppingCarServiceImpl shoppingCarServiceImpl;
	
	@RequestMapping("add_car")
	public String add_car(T_MALL_SHOPPINGCAR car,HttpSession session,HttpServletRequest request) {
		
		T_MALL_SHOPPINGCAR user = (T_MALL_SHOPPINGCAR) session.getAttribute("user");
		
		if( user == null ) {
			Cookie[] cookies = request.getCookies();
			if( cookies == null || cookies.length == 0) {
				List<T_MALL_SHOPPINGCAR> list_car = new ArrayList<T_MALL_SHOPPINGCAR>();
				list_car.add(car);
				//直接添加新的购物车
				new Cookie("list_car_cookie", "list_car");
			}else {
				List<T_MALL_SHOPPINGCAR> list_car = new ArrayList<T_MALL_SHOPPINGCAR>();
				
			}
		}
		
		return "redirect:/sale_shoppingCart_success";
	}

}
