<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chSourceHighlighting']">
    <!--script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?autoload=true&amp;skin=sunburst&amp;lang=css" defer="defer"></script-->


    <xsl:if test="normalize-space(c:abstract) != ''">
      <p style="margin: 1em 0;font-weight:bold;">
        <xsl:value-of disable-output-escaping="yes" select="normalize-space(c:abstract) "/>
      </p>
    </xsl:if>
    
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

    <xsl:if test="normalize-space($entry/c:title) != ''">
      <h3>
        <xsl:if test="$entry/@style != ''">
          <xsl:attribute name="style">
            <xsl:value-of select="$entry/@style"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$entry/c:title"/>
      </h3>
    </xsl:if>
    
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


    <xsl:if test="$entry/c:sourceContent/@title and normalize-space($entry/c:sourceContent/@title) != ''">
      <h6 style="margin:0; background-color:gray;color:white;padding:.2em .5em;font-weight:bold;">
        <xsl:value-of select="$entry/c:sourceContent/@title"/>
      </h6>
    </xsl:if>

    <xsl:variable name="style" select="'overflow:hidden;border:none;background-color:rgb(238, 238, 238);padding:1em;border:solid 1px rgb(176, 172, 172);'" />
    <xsl:if test="normalize-space($entry/c:sourceContent)">
      <xsl:choose>
        <xsl:when test="$entry/c:sourceContent/@type = 'html'">
          <div style="{$style}">
            <xsl:value-of disable-output-escaping="yes" select="$entry/c:sourceContent"/>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <!-- Language hints can be put in XML application directive style comments. -->
          <?prettify lang=html linenums=false?>
          <pre class="prettyprint" id="$entry/c:sourceContent/@componentId"
               style="{$style}">
            <xsl:value-of disable-output-escaping="no" select="$entry/c:sourceContent"/>
          </pre>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
    
    <xsl:if test="count($entry/c:comment/*[normalize-space(text()) != '']) &gt; 0">
        <div style="background-color:#D5D5FC;padding:2em;border-radius:4px;
                    border:1px solid #BABACE;margin-top:1em;">
            <xsl:for-each select="$entry/c:comment/*">
                <xsl:if test="normalize-space(current()) != ''">
                    <div style="color:rgb(205, 76, 0);font-weight:bold;">
                      &#9830;&#160;<xsl:value-of disable-output-escaping="yes" select="current()"/>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>  