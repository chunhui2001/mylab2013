<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chHeader']">
  	
  	<div class="chHeader" id="{@componentId}">			
	  	<h1 style="font:1.75em 'Segoe UI Light';border-bottom:1px solid #ccc;padding-bottom:0.1em;{c:h1/@style}">
	  		<xsl:value-of select="c:h1" />	
	  	</h1>		
	  	<h2 style="{c:h2/@style}">
	  		<xsl:value-of disable-output-escaping="yes" select="c:h2" />	
	  	</h2>
	  	
	  	
  	 <!--xsl:text disable-output-escaping="yes"><![CDATA[ 
  	 <jsp:include page="/templates/components/smoJspTest/smoJspTest.jsp" flush="true" />
  	 ]]></xsl:text-->	
  	</div>
  </xsl:template>
</xsl:stylesheet>  