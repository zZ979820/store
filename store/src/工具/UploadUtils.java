package 工具;

import java.util.UUID;

public class UploadUtils {
	/**
	 * 获取随机名称
	 * @param realName 真实名称
	 * @return uuid
	 */
	public static String getUUIDName(String realName){
		//realname  可能是  1.jpg   也可能是  1
		//获取后缀名
		int index = realName.lastIndexOf(".");
		if(index==-1){
			return UUID.randomUUID().toString().replace("-", "").toUpperCase();
		}else{
			return UUID.randomUUID().toString().replace("-", "").toUpperCase()+realName.substring(index);
		}
		//return null;
	}
	
	/**
	 * 获取文件真实名称
	 * @param name
	 * @return
	 */
	public static String getRealName(String name){
		// c:/upload/1.jpg    1.jpg
		//获取最后一个"/"
		int index = name.lastIndexOf("\\");
		return name.substring(index+1);
	}
	
	/**
	 * 获取文件目录
	 * @param name 文件名称
	 * @return 目录
	 */
	public static String getDir(String name){
		int i = name.hashCode();
		String hex = Integer.toHexString(i);
		int j=hex.length();
		for(int k=0;k<8-j;k++){
			hex="0"+hex;
		}
	//	System.out.println(hex);
		return "/"+hex.charAt(0)+"/"+hex.charAt(1);
	}
	
	public static void main(String[] args) {
		String s="0";
		String s1="1.jpg";
		//System.out.println(getUUIDName(s));
		//System.out.println(getUUIDName(s1));
		//System.out.println(getRealName(s));
		//System.out.println(getRealName(s1));
		System.out.println(getDir(s));
		System.out.println(getDir(s1));
		//getDir(s);
		//getDir(s1);
	}
}
