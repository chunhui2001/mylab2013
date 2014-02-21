<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chHeader']">
  	
  	<div class="chHeader" id="{@componentId}">			
	  	<h1 style="border-bottom:1px solid #ccc;{c:h1/@style}">
        <xsl:value-of disable-output-escaping="yes" select="c:h1" />	
	  	</h1>

      <xsl:if test="normalize-space(c:h2) != ''">
	  	  <h2 style="{c:h2/@style}">
	  		  <xsl:value-of disable-output-escaping="yes" select="c:h2" />	
	  	  </h2>
      </xsl:if>
	  	
  	 <!--xsl:text disable-output-escaping="yes"><![CDATA[ 
  	 <jsp:include page="/templates/components/smoJspTest/smoJspTest.jsp" flush="true" />
  	 ]]></xsl:text-->	
  	</div>
  </xsl:template>
</xsl:stylesheet>  