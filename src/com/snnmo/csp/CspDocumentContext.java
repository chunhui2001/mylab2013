package com.snnmo.csp;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.dom4j.*;
import org.dom4j.io.*;

import com.snnmo.csp.CspHelper.MasterType;

public class CspDocumentContext {
	private String root = null;
	private HttpServletResponse response = null;
	
	private String pageType = null;
	private String masterType = null;
	
	private String title = null;
	private List<Node> includes = null;
	private List<Node> masterIncludes = null;
	private Document document = null;		// page document
	private Document masterDocument = null;	// master document
	
	private Document pageTemplate = null; 	//
	private Document masterTemplate = null;	// 
	
	private String masterFile = null;
	
	@SuppressWarnings("unchecked")
	public CspDocumentContext(Document doc, String root,HttpServletResponse response) throws DocumentException, IOException{
		if (doc == null) return;
		
		this.root = root;
		this.response = response;	
		
		if(CspHelper.masterType == MasterType.XML) {
			initMaster();
		}
		
		document = doc;

		Node typeNode = document.selectSingleNode("/c:page/@type");
		if(typeNode != null)
			pageType = typeNode.getText();
		
		Node titleNode = document.selectSingleNode("/c:page/c:title");
		if(titleNode != null)
			title = titleNode.getText();
		

		includes = document.selectNodes("//c:include");
		attachedIncludes(includes);
		

		attachedMainContent(masterDocument.selectSingleNode("//c:content-place-holder"));
	}
	
	public String getMasterFile(){
		return this.masterFile;
	}
	
	@SuppressWarnings("unchecked")
	private void initMaster() throws DocumentException, IOException {			
		this.masterFile = this.root + CspHelper.getMaster();
		SAXReader reader = new SAXReader();
		masterDocument = reader.read(this.masterFile);
		
		Node masterTypeNode = masterDocument.selectSingleNode("//c:master/@type");
		if(masterTypeNode != null)
			masterType = masterTypeNode.getText();
		
		masterIncludes = masterDocument.selectNodes("//c:include");
		attachedIncludes(masterIncludes);
	}
	
	public Document getMasterDocument(){
		return this.masterDocument;
	}

	public String getPageType () {
		if (!(pageType != null && pageType.trim().length() > 0)) return "";
		
		return root + CspHelper.pageTemplatePath + "/" + pageType + "/" + pageType + ".xslt";
	}
	
	public String getMasterType(){
		if (!(masterType != null && masterType.trim().length() > 0)) return "";
		
		return root + CspHelper.masterTemplatePathRoot + "/" + masterType + "/" + masterType + ".xslt";
	}
	
	public String getComponentType(Node includeNode){
		String type = "";
		
		if(includeNode == null) return type;
		
		Node typeNode = includeNode.selectSingleNode("@type");
		if(typeNode != null){
			type = typeNode.getText();
		}
		
		type = root + CspHelper.componentsTemplatePath + "/" + type + "/" + type + ".xslt";
		
		return type;
	}
	
	public String getTitle() {		
		return title;
	}

	public List<Node> getIncludes() {
		return includes;
	}
	
	public Document getDocument(){
		return this.document;
	}
	

	public Document getMasterTemplate() throws  IOException{
		Document masterTemplate = null;		

		SAXReader reader = new SAXReader();
		try {
			masterTemplate = reader.read(getMasterType());
		} catch (DocumentException e) {
			this.response.getWriter().println("Not DocumentException: " + e.getMessage());
		}
		 
		StringBuffer importXslt = new StringBuffer();
		
		for (Node node : masterIncludes) {		   
		   String s = "<xsl:import href=\"" + getComponentType(node) + "\"/>\r\n";
		   if(!importXslt.toString().contains(s)) importXslt.append(s);
		}		

		String tmplString = masterTemplate.asXML()
				.replace("<xsl:output method=\"html\"", importXslt.toString() + "<xsl:output method=\"html\"");
		
		try {
			masterTemplate = DocumentHelper.parseText(tmplString);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return masterTemplate;
	}
	
	public Document getTemplate() throws DocumentException, IOException{

		
		Document template = null;	
		StringBuffer importXslt = new StringBuffer();
		
		
		if(CspHelper.masterType == MasterType.XML) {
			template = getMasterTemplate();	
		}else {
			SAXReader reader = new SAXReader();
			template = reader.read(getPageType());			
		}
		
		String templateStringTest = template.asXML();
		
		if(CspHelper.masterType == MasterType.XML){
			String s = "<xsl:import href=\"" + getPageType() + "\"/>";
		    importXslt.append(s + "\r\n");
		}
		 
		for (Node node : includes) {		   
		   String s = "<xsl:import href=\"" + getComponentType(node) + "\"/>";
		   if(!importXslt.toString().contains(s) && templateStringTest.indexOf(s) == -1) 
			   importXslt.append(s + "\r\n");
		}		

		
		String tmplString = template.asXML()
				.replace("<xsl:output method=\"html\"", importXslt.toString() + "<xsl:output method=\"html\"");
		template = DocumentHelper.parseText(tmplString);

		
		return template;
	}
	
	public void attachedIncludes(List<Node> includeNodes) throws DocumentException, IOException{
		if(includeNodes == null) return;		

		SAXReader reader = new SAXReader();
		
 	 	String location = "";
 	 	Element currentIncludeElement = null;
 	 	
		for (Node node : includeNodes) {
			 currentIncludeElement = (Element)node;	
	 		 location = root + currentIncludeElement.valueOf("@path"); 
	 		 
	 		 File includeFile = new File(location);		 	 		 
	 		 if(!includeFile.exists()) {
	 			 continue;
	 		 }
	 		 
	 		 Document includeDocument = reader.read(includeFile);
	 		 currentIncludeElement.add(includeDocument.getRootElement());	 		 
	 	}
	}

	public void attachedMainContent(Node placeHolder){
		if(placeHolder == null) return;
		
		((Element)placeHolder).add(document.getRootElement());
	}
}
