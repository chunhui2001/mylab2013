package com.snnmo.web;

import com.snnmo.csp.*;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

@SuppressWarnings("serial")
public class SnnmoServlet extends HttpServlet {
	
	private CspPageContext cspPageContext = null;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8"); 
		
		
		
		
		try {			
			setCspPageContext(new CspPageContext(req,resp));
			//resp.getWriter().println("csp");
			
			if(cspPageContext.isPageExists()){		
				if(CspHelper.masterType == CspHelper.MasterType.JSP) {
					req.setAttribute("pageTitle", cspPageContext.getDocumentContext().getTitle());
					req.setAttribute("pageContent", cspPageContext.getPageContent());
					
				    RequestDispatcher rd = req.getRequestDispatcher(CspHelper.getMaster());
				    rd.forward(req, resp);
				} else {
					/*resp.getWriter().println("Page exists: " + cspPageContext.getDocumentContext().getMasterFile());
					resp.getWriter().println("Page: " + cspPageContext.getDocumentContext().getPageType());
					resp.getWriter().println("Page: " + cspPageContext.getDocumentContext().getTemplate().asXML());
					resp.getWriter().println("csp.");
					*/
					resp.getWriter().println(cspPageContext.getPageContent());
				}
			}else {
				resp.getWriter().println("Page not exists!");
			}
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public CspPageContext getCspPageContext() {
		return cspPageContext;
	}

	public void setCspPageContext(CspPageContext cspPageContext) {
		this.cspPageContext = cspPageContext;
	}
}
