package com.ddb.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddb.springmvc.domain.Product;
import com.ddb.springmvc.form.ProductForm;
import com.ddb.springmvc.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = Logger.getLogger(ProductController.class);

	// 自动注入向后端数据库写数据的组件
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/product_input")
	public String inputProduct() {
		logger.info("inputProduct 被调用！");
		return "ProductForm";
	}

	@RequestMapping(value = "/product_save", method = RequestMethod.POST)
	public String saveProduct(ProductForm productForm, RedirectAttributes redirectAttributes) {
		logger.info("saveProduct 被调用！");

		Product product = new Product();
		product.setName(productForm.getName());
		product.setDescription(productForm.getDescription());

		try {
			product.setCount(Integer.parseInt(productForm.getCount()));
			product.setPrice(Double.parseDouble(productForm.getPrice()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// add product
		Product saveProduct = productService.add(product);
		// 使用下面的对象，可以给重定向传值！
		redirectAttributes.addFlashAttribute("message", "The product was successfully added!");
		return "redirect:/product_view/" + saveProduct.getId() + ".action";
	}

	// http://localhost:8080/SpringMvc4.3-Start/product_view/2.action
	@RequestMapping(value = "/product_view/{id}") // {}内的id为路径变量
	public String viewProduct(@PathVariable Long id, Model model) {
		Product product = productService.get(id);
		model.addAttribute("product", product);
		return "ProductView";
	}

	// http://localhost:8080/SpringMvc4.3-Start/product_retrieve.action?id=1
	@RequestMapping(value = "/product_retrieve")
	public String sendProduct(@RequestParam Long id, Model model) {
		// 使用@RequestParam获取URL路径上？后面的参数，而serlet中是使用Request对象的getParameter()方法
		Product product = productService.get(id);
		model.addAttribute("product", product);
		return "ProductView";
	}

	/**
	 * 列表显示所有信息
	 * 
	 * @param productForm
	 * @param redirectAttributes
	 * @return
	 */

	@RequestMapping(value = "/product_saveAll", method = RequestMethod.POST)
	public String saveAllProduct(ProductForm productForm, RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		logger.info("saveAllProduct 被调用！");

		Product product = new Product();
		product.setName(productForm.getName());
		product.setDescription(productForm.getDescription());

		try {
			product.setCount(Integer.parseInt(productForm.getCount()));
			product.setPrice(Double.parseDouble(productForm.getPrice()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// add product
		Product saveProduct = productService.add(product);
		// 使用下面的对象，可以给重定向传值！
		redirectAttributes.addFlashAttribute("message", "The product was successfully added!");
		return "redirect:/products_view/all.action";
	}

	@RequestMapping(value = "/products_view/all.action") // 路径写死
	public String viewAllProduct(Model model, HttpServletRequest request) {
		Map<Long, Product> products = new HashMap<Long, Product>();
		products = productService.getAll();
		// 将数组保存到session中
		request.getSession().setAttribute("products", products);
		logger.info("products已经保存到session");
		model.addAttribute("products", products);
		return "AllProduct";
	}

	/**
	 * 删除某条信息
	 * 
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */

	@RequestMapping(value = "/products_view/product_del")
	public String del(Long id, HttpServletRequest request, Model model) {
		//取出所有的map
		Map<Long, Product> products = (Map<Long, Product>) request.getSession().getAttribute("products");
		//遍历checkbook中的value值，并循环删除
		String[] ids = request.getParameterValues("checkID");
		if (ids.length > 0) {
			for (int i = 0; i < ids.length; i++) {
				id = Long.valueOf(ids[i]);
				products = productService.del(id);
			}
			model.addAttribute("products", products);
			logger.info("删除成功");
			return "AllProduct";
		} else {
			return "AllProduct";
		}

	}

	/**
	 * 修改
	 */
	@RequestMapping(value = "/products_view/product_update")
	public String update(Long id, HttpServletRequest request, Model model) {
		//获取a标签传递的id值，并将其放入session
		request.getSession().setAttribute("id", id);
		Product productNeedUpadate = productService.get(id);
		request.getSession().setAttribute("name", productNeedUpadate.getName());
		request.getSession().setAttribute("description", productNeedUpadate.getDescription());
		request.getSession().setAttribute("price", productNeedUpadate.getPrice());
		request.getSession().setAttribute("count", productNeedUpadate.getCount());
		return "ProductUpdate";
	}

	@RequestMapping(value = "/products_view/product_update_view", method = RequestMethod.POST)
	public String ProductUpdate(ProductForm productForm, HttpServletRequest request) {
		logger.info("saveAllProduct 被调用！");
		//取出session中的值，取出所有map
		Long id = (Long) request.getSession().getAttribute("id");
		Map<Long, Product> products = (Map<Long, Product>) request.getSession().getAttribute("products");
		//根据session中id值找出对应实体
		Product productNeedUpadate = productService.get(id);
		//逐个判断有么有更改输入框的值，有则重新赋值，没有跳过
		if (productForm.getName() != "") {
			productNeedUpadate.setName(productForm.getName());
		}else {
			productNeedUpadate.setName(productNeedUpadate.getName());
		}
		
		
		if (productForm.getDescription() != "") {
			productNeedUpadate.setDescription(productForm.getDescription());
		}else {
			productNeedUpadate.setDescription(productNeedUpadate.getDescription());
		}
		
		
		if (productForm.getPrice() != null) {
			try {
				productNeedUpadate.setPrice(Double.parseDouble(productForm.getPrice()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			productNeedUpadate.setPrice(productNeedUpadate.getPrice());
		}
		
		
		if (productForm.getCount() != null) {
			try {
				productNeedUpadate.setCount(Integer.parseInt(productForm.getCount()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			productNeedUpadate.setCount(productNeedUpadate.getCount());
		}
		
		
		// 先删后放
		products = productService.del(id);
		products.put(id, productNeedUpadate);
		return "redirect:/products_view/all.action";

	}
}
