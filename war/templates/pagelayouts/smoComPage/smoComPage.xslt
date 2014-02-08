<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:page[@type='smoComPage']">
		<xsl:for-each select="c:column">
				<div class="col">
						<xsl:for-each select="c:row">
							<div class="ro">
								<xsl:for-each select="c:cell">
									<div class="ce" style="{@style};margin:{@margin};float:{@float};">
										<xsl:for-each select="c:include">
											<xsl:apply-templates select="c:component" />
										</xsl:for-each>
									</div>
									<div class="clear"></div>
								</xsl:for-each>	
							</div>
						</xsl:for-each>
				</div>
		</xsl:for-each>
  </xsl:template>
</xsl:stylesheet>  