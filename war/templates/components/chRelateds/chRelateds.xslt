<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                xmlns:util="http://com.snnmo.website.util"
                xmlns:exsl="http://exslt.org/common"
                exclude-result-prefixes="c util"
              extension-element-prefixes="exsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:param name="language" />
  <xsl:param name="APP_ROOT" />
  <xsl:param name="PAGE_URI" />

  <xsl:template match="c:component[@type='chRelateds']">
    <xsl:variable name="articleMaster" select="document(concat($APP_ROOT,'/RichMedia/blog/smoArticleMaster.xml'))/*" />
    <xsl:variable name="relatedArticles" select="$articleMaster/c:article[c:articleLink=$PAGE_URI]/c:related/c:r1" />

    <xsl:if test="count($relatedArticles[text() != '']) &gt; 0">
      <h1 style="margin-top:1.5em;">相关文章：</h1>
      <ul style="list-style:initial;color:#2a6496;margin-left:1.5em;">
        <xsl:for-each select="$relatedArticles">
          <li>
            <a target="_blank" href="{normalize-space(current()/text())}">

              <xsl:choose>
                <xsl:when test="current()/@title">
                  <xsl:value-of select="current()/@title"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$articleMaster/c:article[c:articleLink=normalize-space(current()/text())]/c:title" />
                </xsl:otherwise>
              </xsl:choose>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </xsl:if>

  </xsl:template>
</xsl:stylesheet>
