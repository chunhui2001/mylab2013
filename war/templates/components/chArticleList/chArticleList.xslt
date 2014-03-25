﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                xmlns:util="http://com.snnmo.website.util"
                exclude-result-prefixes="c util">
  <xsl:output method="html" indent="yes"/>
  <xsl:param name="language" />
  <xsl:param name="APP_ROOT" />
  
  <xsl:template match="c:component[@type='chArticleList']">
    <xsl:variable name="articles" select="document(concat($APP_ROOT,'/RichMedia/blog/smoArticleMaster.xml'))/*/c:article" />
    
    <div class="chArticleList">
      
      <xsl:for-each select="$articles">
        <xsl:sort select="c:pubDate" data-type="number" order="descending"/>
        <!--xsl:sort select="generate-id()" data-type="text" order="descending"/-->
        <div class="article">
          <xsl:if test="position() != last()">
            <xsl:attribute name="style">
              <xsl:value-of select="'margin-bottom:1.5em;'"/>
            </xsl:attribute>
          </xsl:if>

          <h4 style="font-size:1.2em;margin-bottom:.4em;">
            <a target="_blank" href="{c:articleLink}"> 
              <xsl:value-of select="c:title"/>
            </a>
          </h4>
          <span style="color:gray;">
            <xsl:call-template name="util-formatDate">
              <xsl:with-param name="value" select="c:pubDate" />
            </xsl:call-template>
            <!--xsl:value-of select="c:pubDate"/-->
          </span>
          <p style="margin:.2em 0;color:rgb(67, 65, 65);">
            <xsl:value-of disable-output-escaping="yes" select="c:abstract"/>
          </p>
        </div>
      </xsl:for-each>
    </div>


  </xsl:template>
</xsl:stylesheet>  