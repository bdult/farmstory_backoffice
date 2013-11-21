package com.bgg.farmstoryback.common;

import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class PostApiUtil {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());

	private final String URL = "http://openapi.epost.go.kr/postal/retrieveNewAdressService/retrieveNewAdressService/getNewAddressList";
	
	//Unho dev service key
	private final String SERVICE_KEY = "Cjso/MVtBKmmlaTCL5JlbdPozTRBWknR42ujuuEnun8zRtISeezAPK3UIBxus6a9Z0IqBAjS7J7Hlwgb7dcrtQ==";

	/**
	 * 파라미터로 우체국 API로부터 주소록을 가져온다
	 * 
	 * @필수 searchSe(기본값:road), srchwrd(예:개봉로 20)
	 * @return
	 */
	public String getAddr(Map<String, Object> requestParam) {
		
		String result = null;
		try {
			//init
			String type = requestParam.get("searchSe").toString();
			String query = requestParam.get("srchwrd").toString();
			if(!type.equalsIgnoreCase("dong") && !type.equalsIgnoreCase("post") && !type.equalsIgnoreCase("road")){
				type = "road";
			}
			
			//connection epost API
			HttpGet httpget = new HttpGet(URL + String.format("?searchSe=%s&srchwrd=%s&ServiceKey=%s", type, URLEncoder.encode(query, "UTF-8"), SERVICE_KEY));
			CloseableHttpClient httpclient = HttpClients.createDefault();
			CloseableHttpResponse response = httpclient.execute(httpget);
			
			int responseCode = response.getStatusLine().getStatusCode();
			
			if (responseCode == 200) {
				
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					InputStream instream = entity.getContent();
					try {
						result = IOUtils.toString(instream, "UTF-8");
					} finally {
						instream.close();
					}
				}
				
			}
			response.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
