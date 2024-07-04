package shopping.util;

import java.util.ArrayList;
import java.util.List;


import com.company.shopping.bean.GType;



public class Util {
	static List<GType> newal = new ArrayList<GType>();
	public static List<GType>  parse(int pid,String s,List<GType> al){
		for(int i=0;i<al.size();i++){
			GType gt = al.get(i);
			if(gt.getPid()==pid){
				gt.setTypename(s+gt.getTypename());
				newal.add(gt);
				parse(gt.getId(), s+"&nbsp;&nbsp;", al);
			}
		}
		return  newal; 
	} 
}
