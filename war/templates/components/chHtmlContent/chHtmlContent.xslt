<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chHtmlContent']">
    <xsl:for-each select="c:content">
      <div>
        <xsl:if test="@style != ''">
          <xsl:attribute name="style">
            <xsl:value-of select="@style"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:if test="@class != ''">
          <xsl:attribute name="class">
            <xsl:value-of select="@class"/>
          </xsl:attribute>
        </xsl:if>
        
        <xsl:choose>
       		<xsl:when test="@disable-output-escaping = 'no'">
       			<xsl:value-of select="current()/text()"/>
       		</xsl:when>
       		<xsl:otherwise>
       			<xsl:value-of disable-output-escaping="yes" select="current()/text()"/>
       		</xsl:otherwise>
       	</xsl:choose>
        
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>  