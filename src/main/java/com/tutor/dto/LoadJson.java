package com.tutor.dto;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LoadJson {
	
	public String getAddressJson(String url){
		  StringBuilder json = new StringBuilder();                  
		    try {  
		        URL urlObject = new URL(url);  
		        URLConnection uc = urlObject.openConnection();  
		        BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream(),"utf-8"));  
		        String inputLine = null;  
		        while ( (inputLine = in.readLine()) != null) {  
		            json.append(inputLine);  
		        }  
		        in.close();  
		    } catch (MalformedURLException e) {  
		        e.printStackTrace();  
		    } catch (IOException e) {  
		        e.printStackTrace();  
		    }  
		    return json.toString(); 	
	}
	
	public String getV4IP(){
		String ip = "";
		String chinaz = "http://ip.chinaz.com";
		
		StringBuilder inputLine = new StringBuilder();
		String read = "";
		URL url = null;
		HttpURLConnection urlConnection = null;
		BufferedReader in = null;
		try {
			url = new URL(chinaz);
			urlConnection = (HttpURLConnection) url.openConnection();
		    in = new BufferedReader( new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
			while((read=in.readLine())!=null){
				inputLine.append(read+"\r\n");
			}
			//System.out.println(inputLine.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		Pattern p = Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");
		Matcher m = p.matcher(inputLine.toString());
		if(m.find()){
			String ipstr = m.group(1);
			ip = ipstr;
			//System.out.println(ipstr);
		}
		return ip;
	}
	
	
	public static void main(String[] args) {
		LoadJson loadJson = new LoadJson();
		System.out.println("**************"+loadJson.getV4IP());
		
	}
   
}
