<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="APP_ROOT" />
  <xsl:param name="PAGE_URI" />
  
  <xsl:template match="c:component[@type='chArticleHeader']">
  	
  	<div class="chArticleHeader" id="{@componentId}">			
	  	<h1 style="border-bottom:1px solid #ccc;{c:h1/@style}">
        <xsl:value-of disable-output-escaping="yes" select="c:h1" />	
	  	</h1>

      <xsl:if test="normalize-space(c:h2) != ''">
	  	  <h2 style="{c:h2/@style}">
	  		  <xsl:value-of disable-output-escaping="yes" select="c:h2" />	
	  	  </h2>
      </xsl:if>

      <xsl:if test="normalize-space($PAGE_URI) != ''">
        <xsl:variable name="currentArticleMaster" 
                      select="document(concat($APP_ROOT,'/RichMedia/blog/smoArticleMaster.xml'))/*/c:article[normalize-space(c:articleLink)=normalize-space($PAGE_URI)]" />
        <span>
          <xsl:call-template name="util-formatDate">
            <xsl:with-param name="value" select="$currentArticleMaster/c:pubDate" />
          </xsl:call-template>
        </span>
      </xsl:if>
      
  	</div>
  </xsl:template>
</xsl:stylesheet>  