package com.snnmo.csp;


import java.util.*;

public class CspHelper {

	public static final String sitePagesPath = "/sitepages";
	public static final String pageExtends = ".shtml";
	public static final String pageTemplatePath = "/templates/pagelayouts";
	public static final String componentsTemplatePath = "/templates/components";
	public static final String masterPathRoot = "/master";
	public static final String masterTemplatePathRoot = "/templates/master";
	public static final MasterType masterType = MasterType.XML;
	public static final String masterName = "smoComPageMaster";
	
	public static String getMaster(){
		String masterExtends = "jsp";
		
		if(masterType == MasterType.XML) {
			masterExtends = "xml";
		}
		
		return String.format("%s/%s/%s.%s", masterPathRoot, masterName,masterName,masterExtends);
	}
	
	public enum MasterType {
		JSP,
		XML
	}
	
	
	public static String getCountryCode(String name){
		CountryCode cc = CountryCode.getByCode("JP");

		//System.out.println("Country name = " + cc.getName());                // "Japan"
		//System.out.println("ISO 3166-1 alpha-2 code = " + cc.getAlpha2());   // "JP"
		//System.out.println("ISO 3166-1 alpha-3 code = " + cc.getAlpha3());   // "JPN"
		//System.out.println("ISO 3166-1 numeric code = " + cc.getNumeric());  // 392
		return cc == null ? null : String.valueOf(cc.getNumeric());
	}
}
