<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chSourceHighlighting']">
    <!--script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer="defer"></script-->

    <xsl:choose>
      <xsl:when test="count(c:entry) &gt; 0">
        <xsl:for-each select="c:entry">
          <xsl:call-template name="buildContent">
            <xsl:with-param name="entry" select="current()" />
          </xsl:call-template>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="buildContent">
          <xsl:with-param name="entry" select="current()" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    
    
    
  </xsl:template>

  <xsl:template name="buildContent">
    <xsl:param name="entry" />

    <h3>
      <xsl:if test="$entry/@style != ''">
        <xsl:attribute name="style">
          <xsl:value-of select="$entry/@style"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$entry/c:title"/>
    </h3>

    <xsl:for-each select="$entry/c:desc/*">
      <xsl:if test="normalize-space(current()) != ''">
        <xsl:variable name="mb">
          <xsl:if test="position() = last()">
            <xsl:value-of select="'1em'"/>
          </xsl:if>
          <xsl:if test="position() != last()">
            <xsl:value-of select="'0em'"/>
          </xsl:if>
        </xsl:variable>
        <div style="color:rgb(78, 12, 247);font-weight:bold;margin-bottom:{$mb};">
          <xsl:value-of disable-output-escaping="yes" select="current()"/>
        </div>
      </xsl:if>
    </xsl:for-each>

    <!-- Language hints can be put in XML application directive style comments. -->
    <?prettify lang=html linenums=false?>
    <pre class="prettyprint" id="$entry/c:sourceContent/@componentId"
         style="overflow:hidden;border:none;float:left;background-color:rgb(238, 238, 238);width:100%;padding:0;">
      <xsl:value-of disable-output-escaping="no" select="$entry/c:sourceContent"/>
    </pre>
    <div class="clear"></div>

    <xsl:for-each select="$entry/c:comment/*">
      <xsl:variable name="mt">
        <xsl:if test="position() = 1">
          <xsl:value-of select="'1em'"/>
        </xsl:if>
        <xsl:if test="position() != 1">
          <xsl:value-of select="'0em'"/>
        </xsl:if>
      </xsl:variable>
      
      <xsl:if test="normalize-space(current()) != ''">
        <div style="color:rgb(205, 76, 0);font-weight:bold;margin-top:{$mt};">
          <xsl:value-of disable-output-escaping="yes" select="current()"/>
        </div>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>  