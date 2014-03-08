package com.snnmo.csp;

import java.io.IOException;

import javax.servlet.http.*;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.dom4j.*;
import org.dom4j.io.*;

import com.snnmo.csp.CspHelper.MasterType;
import com.snnmo.web.SnnmoServlet;
import java.util.Enumeration;

import java.io.*;

public class CspPageContext {
	private HttpServletRequest request = null;
	private HttpServletResponse response = null;
	
	private String root = null;
	private String sitePagesPath = CspHelper.sitePagesPath;
	private String pageExtends = CspHelper.pageExtends;
	
	private String url = null;
	private String filePath = null;
	private Document pageDocument = null;	
	private Document pageTemplate = null;
	private CspDocumentContext documentContext = null;
	
	private String pageContent = null;	
	
	public CspPageContext(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		this.request = request;
		this.response = response;
		
		root = request.getSession().getServletContext().getRealPath("/");
		url = request.getRequestURI();
		filePath = root + sitePagesPath + url.replaceAll(pageExtends, ".xml");
		
		if(isPageExists()) {
			pageDocument = getPageDocument();
			
			documentContext = new CspDocumentContext(pageDocument, root,response);
			
			pageTemplate = documentContext.getTemplate();
			
			if(CspHelper.masterType == MasterType.XML) {
				pageContent = transfrom(documentContext.getMasterDocument(),pageTemplate);
			}else {
				pageContent = transfrom(pageDocument,pageTemplate);
			}
		}
	}

	public String getUrl() {
		return url;
	}

	public String getFilePath() {
		return filePath;
	}
	
	public Document getPageDocument() throws DocumentException {
		SAXReader reader = new SAXReader();
		pageDocument = reader.read(new File(filePath));
		return pageDocument;
	}

	public String getPageContent() {
		String docType = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">";
		docType = "<!DOCTYPE html>";
		
		if(CspHelper.masterType != MasterType.XML){
			docType = "";
		}
		
		return docType + pageContent;
	}
	
	public boolean isPageExists(){
		boolean b = false;
		
		java.io.File file = new File(filePath);
		b = file.exists();		
		
		return b;
	}

	public CspDocumentContext getDocumentContext() {
		return documentContext;
	}
	

	protected String transfrom(Document doc , Document xsltDocument) throws Exception{		   
		String str = null;
				
		
		TransformerFactory factory = TransformerFactory.newInstance(
				"org.apache.xalan.processor.TransformerFactoryImpl", 
				CspPageContext.class.getClassLoader());  
		
		
		//TransformerFactory factory = TransformerFactory.newInstance();  
		
		InputStream xsltStream = new ByteArrayInputStream(xsltDocument.asXML().getBytes("UTF8"));  
		Transformer transformer = factory.newTransformer(new StreamSource(xsltStream)); 
		
		
		CountryCode cc = CspHelper.getCountryCode(this.request.getLocale().getCountry());
		transformer.setParameter("language", cc.getNumeric());
		transformer.setParameter("country", cc.getName());
		transformer.setParameter("countryCode", this.request.getLocale().getCountry());
		
		transformer.setParameter("APP_ROOT", this.root);
		
		
		 
		Enumeration enumeration = this.request.getParameterNames();
		String parameterName = "";
        while (enumeration.hasMoreElements()) {
            parameterName = (String) enumeration.nextElement();
    		transformer.setParameter(parameterName, this.request.getParameterValues(parameterName)[0]);
        }
		
		transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes"); 
		
		
		//this.response.getWriter().println(xsltDocument.asXML());
		//this.response.getWriter().println(doc.asXML());
		 
		//transformer.setOutputProperty(OutputKeys.METHOD, "html"); 
		//transformer.setOutputProperty(OutputKeys.MEDIA_TYPE, "text/html"); 
		//transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC,"-//W3C//DTD XHTML 1.0 Strict//EN"); 
		//transformer.setOutputProperty(OutputKeys.DOCTYPE_SYSTEM, "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"); 
		//transformer.setOutputProperty(OutputKeys.CDATA_SECTION_ELEMENTS, "script style"); 
		transformer.setOutputProperty(OutputKeys.ENCODING, "utf-8"); 
	
		StringWriter writer = new StringWriter();
		StreamResult result = new StreamResult( writer );  

		DocumentSource source = new DocumentSource(doc);  
		try{
		    transformer.transform(source, result);  
		}catch(Exception e){
			e.printStackTrace();
			this.response.getWriter().println("Transform Error!");
		}
	   
		str = writer.toString();
		//str = "hhhh";
		return str;			
	}
	
}
