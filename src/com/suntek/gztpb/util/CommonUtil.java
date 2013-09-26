package com.suntek.gztpb.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtil {
	
	public static Timestamp parseToTimestamp( String timeFormat, String source) throws ParseException{
		DateFormat df =	new SimpleDateFormat(timeFormat);
		Date d = df.parse(source);
		return new Timestamp(d.getTime());
	}
	
	/**
	 * 获取附件的二进制数组
	 * @param fileName
	 * @return
	 */
	public static byte[] getFileByte(String filePath){
		try {
			//this.servletContext.getRealPath("/picUpload/")+"\\"+fileName;
			File file = new File(filePath);
			if (file.exists()){
				InputStream stream=new FileInputStream(file);
				return input2byte(stream);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 文件流转换为二进制
	 * @param inStream
	 * @return
	 * @throws IOException
	 */
	public static byte[] input2byte(InputStream inStream) throws IOException {
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[100];
		int rc = 0;
		while ((rc = inStream.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		byte[] in2b = swapStream.toByteArray();
		return in2b;
	}

}
