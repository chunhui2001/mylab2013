<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:param name="language" />
  <xsl:param name="country" />
  <xsl:param name="countryCode" />
  
  <xsl:template match="c:master[@type='smoComPageMaster']">  
  <html lang="{$language}">
  	<head>
	  	<title>
	  		<xsl:value-of select="//c:title" />
	  	</title>
      <xsl:if test="normalize-space($country) != ''">
        <meta property="country" content="{$country}" />
      </xsl:if>
      <xsl:if test="normalize-space($countryCode) != ''">
        <meta property="countryCode" content="{$countryCode}" />
      </xsl:if>
        
	  	<link rel="stylesheet" type="text/css" href="/RenderingAssets/css/reset.css" />
	  	<link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/bootstrap/bootstrap.min.css" />
	  	<link rel="stylesheet" type="text/css" href="/RenderingAssets/css/global.css" />
	  	
	  	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-1.10.1.min.js"></script>	  	
	  	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-migrate-1.2.1.min.js"></script>



      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/jCarousel/jcarousel.responsive.css"/>
      <script type="text/javascript" src="/RenderingAssets/lib/jCarousel/jquery.jcarousel.min.js"></script>

  	</head>
  	<body>
	  	<div>
	  		<xsl:for-each select="c:column">
					<div class="col">
							<xsl:for-each select="c:row">
								<div class="ro">
									<xsl:for-each select="c:cell">
										<div class="ce {@class}" style="{@style};margin:{@margin};float:{@float};">
											<xsl:for-each select="c:include">
												<xsl:apply-templates select="c:component" />
											</xsl:for-each>
											
											<xsl:for-each select="c:content-place-holder">
												<xsl:apply-templates select="c:page" />
											</xsl:for-each>
										</div>
										<div class="clear"></div>
									</xsl:for-each>	
								</div>
							</xsl:for-each>
					</div>
			</xsl:for-each>
	  	</div>
  	</body>
  </html>
  </xsl:template>
</xsl:stylesheet>  