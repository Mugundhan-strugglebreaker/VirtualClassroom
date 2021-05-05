package Servlets;
import com.google.gson.Gson;
import java.util.*;
public class JsonObj {
  
	public static String Convert(List<Map<Object,Object>> list )
	{
		Gson gson=new Gson();
		String str=gson.toJson(list);
		return str;
	}
	
}
