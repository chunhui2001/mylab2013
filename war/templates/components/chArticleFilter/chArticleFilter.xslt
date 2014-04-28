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

  <xsl:template match="c:component[@type='chArticleFilter']">
    <xsl:variable name="articles" select="document(concat($APP_ROOT,'/RichMedia/blog/smoArticleMaster.xml'))/*/c:article" />
    
    <xsl:variable name="monthList">
      <monthList>
        <xsl:for-each select="c:years/c:year">
          <xsl:call-template name="chArticleFilter-build-month">
            <xsl:with-param name="start" select="concat(current(), '00')" />
          </xsl:call-template>
        </xsl:for-each>
      </monthList>
    </xsl:variable>


    

    <ul class="chArticleFilter" style="margin-top:2em;">

      <xsl:for-each select="exsl:node-set($monthList)/monthList/month">
        <xsl:sort select="current()" data-type="number" order="descending"/>
        <xsl:variable name="articleCount" select="count($articles[contains(c:pubDate, current())])" />
        <xsl:if test="$articleCount != 0">
          <li style="text-align:right;font-size:1.2em;padding:.2em 0;">
            <span>
              <xsl:call-template name="chArticleFilter-format-date">
                <xsl:with-param name="date" select="current()" />
              </xsl:call-template>
            </span>
            <span>
              <xsl:if test="string-length($articleCount) = 1">
                <xsl:value-of select="concat(' (0', $articleCount, ')')"/>
              </xsl:if>
              <xsl:if test="string-length($articleCount) = 2">
                <xsl:value-of select="concat(' (', $articleCount, ')')"/>
              </xsl:if>
            </span>
          </li>
        </xsl:if>
      </xsl:for-each>
    </ul>


  </xsl:template>

  <xsl:template name="chArticleFilter-build-month">
    <xsl:param name="start" />
    <xsl:variable name="end" select="12" />
    <xsl:call-template name="chArticleFilter-loop">
      <xsl:with-param name="start" select="number($start)" />
      <xsl:with-param name="end" select="number($start) + number($end)" />

    </xsl:call-template>
  </xsl:template>

  <xsl:template name="chArticleFilter-loop">
    <xsl:param name="start" />
    <xsl:param name="end" />

    <xsl:if test="$start &lt; $end">
      <month>
        <xsl:value-of select="$start + 1"/>
      </month>

      <xsl:call-template name="chArticleFilter-loop">
        <xsl:with-param name="start" select="$start + 1" />
        <xsl:with-param name="end" select="$end" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="chArticleFilter-format-date">
    <xsl:param name="date" />

    <xsl:variable name="year" select="substring($date,1,4)" />

    <xsl:variable name="month" select="substring($date,5,2)" />

    <xsl:variable name="month-en">
      <xsl:if test="$month = '01'">
        <xsl:value-of select="'Jan'"/>
      </xsl:if>
      <xsl:if test="$month = '02'">
        <xsl:value-of select="'Feb'"/>
      </xsl:if>
      <xsl:if test="$month = '03'">
        <xsl:value-of select="'Mar'"/>
      </xsl:if>
      <xsl:if test="$month = '04'">
        <xsl:value-of select="'Apr'"/>
      </xsl:if>
      <xsl:if test="$month = '05'">
        <xsl:value-of select="'May'"/>
      </xsl:if>
      <xsl:if test="$month = '06'">
        <xsl:value-of select="'Jun'"/>
      </xsl:if>
      <xsl:if test="$month = '07'">
        <xsl:value-of select="'Juy'"/>
      </xsl:if>
      <xsl:if test="$month = '08'">
        <xsl:value-of select="'Agu'"/>
      </xsl:if>
      <xsl:if test="$month = '09'">
        <xsl:value-of select="'Sept'"/>
      </xsl:if>
      <xsl:if test="$month = '10'">
        <xsl:value-of select="'Oct'"/>
      </xsl:if>
      <xsl:if test="$month = '11'">
        <xsl:value-of select="'Nov'"/>
      </xsl:if>
      <xsl:if test="$month = '12'">
        <xsl:value-of select="'Dec'"/>
      </xsl:if>
    </xsl:variable>

    <xsl:value-of select="concat($month-en, ', ', $year)"/>
  </xsl:template>
</xsl:stylesheet>  