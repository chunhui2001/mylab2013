﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:page[@type='smoComPage']">
    <xsl:for-each select="c:script">
      <xsl:value-of disable-output-escaping="yes" select="current()"/>
    </xsl:for-each>
    
		<xsl:for-each select="c:column">
      <xsl:variable name="class_main_content">
        <xsl:choose>
          <xsl:when test="normalize-space(@class) != ''">
            <xsl:value-of select="@class"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'main-content'"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
				<div class="col {$class_main_content}">
						<xsl:for-each select="c:row">
							<div class="ro">
								<xsl:for-each select="c:cell">
									<div class="ce" style="{@style};width:{@width};margin:{@margin};float:{@float};">
										<xsl:for-each select="c:include">
											<xsl:apply-templates select="c:component" />
										</xsl:for-each>
									</div>
								</xsl:for-each>
                <div class="clear"></div>
							</div>
						</xsl:for-each>
				</div>
		</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>  