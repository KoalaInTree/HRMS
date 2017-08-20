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
	 *      �����ϴ��ļ�������
	 * @param path
	 *      ����������ļ���·��
	 * @return
	 * 		��������ļ���
	 */
	public static List<String> uploadFiles(HttpServletRequest request, String path){
		List<String> list = new ArrayList<String>();
		
		// ����һ��ͨ�õĶಿ�ֽ�����
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// �ж� request�Ƿ��Ǹ��ϵ�����ʽ����������ʽ��ֻҪrequest�д����ļ���
		if (multipartResolver.isMultipart(request)) {
			// ������requestת���ɸ���request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// ȡ��request�е������ļ���
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// ȡ���ϴ��ļ�
				MultipartFile file = multiRequest.getFile(iter.next());
				if (file != null) {
					// ȡ�õ�ǰ�ϴ��ļ���ԭʼ����
					String oldName = file.getOriginalFilename();
					// ������Ʋ�Ϊ"",˵�����ļ����ڣ�����˵�����ļ�������
					if (oldName.trim() != "") {
						// ȡ�õ�ǰ�ϴ��ļ�����չ��(��.)
						String extName = oldName.substring(oldName
								.lastIndexOf("."));
						
						// �������ϴ�����ļ���,��ʱ������������򲻻�����
						//(1)��ʱ�䷽ʽ����
						//(2)��ĳ��ʵ�����������  ������Ա�����������Ա����ͷ��
						String newName = System.currentTimeMillis() + extName;

						// ��ͼƬ�ϴ���������tomcat��
						String pa = request.getRealPath(path);
						// �����ϴ�·��
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
