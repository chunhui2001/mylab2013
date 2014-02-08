package com.snnmo.csp;

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
}
