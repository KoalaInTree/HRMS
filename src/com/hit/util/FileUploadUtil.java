package com.hit.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class FileUploadUtil {
	
	/**
	 * 
	 * @param request
	 *      接收上传文件的请求
	 * @param path
	 *      服务器存放文件的路径
	 * @return
	 * 		长传后的文件名
	 */
	public static List<String> uploadFiles(HttpServletRequest request, String path){
		List<String> list = new ArrayList<String>();
		
		// 创建一个通用的多部分解析器
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request是否是复合的请求方式（复合请求方式：只要request中带有文件）
		if (multipartResolver.isMultipart(request)) {
			// 将常规request转换成复合request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// 取得当前上传文件的原始名称
					String oldName = file.getOriginalFilename();
					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (oldName.trim() != "") {
						// 取得当前上传文件的扩展名(带.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						
						// 重命名上传后的文件名,以时间毫秒数命名则不会重名
						//(1)以时间方式命名
						//(2)以某个实体的主键命名  比如用员工编号来命名员工的头像
						String newName = System.currentTimeMillis() + extName;

						// 将图片上传至部署在tomcat中
						String pa = request.getRealPath(path);
						// 定义上传路径
						File p = new File(pa);
						if(!p.exists()){
							p.mkdirs();
						}
						File localFile = new File(p,newName);
						try {
							file.transferTo(localFile);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						list.add(newName);
					}
				}
			}
		
		}
		return list;
	}

}
