<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                xmlns:jmath="http://www.oracle.com/XSL/Transform/java/java.lang.Math"
                xmlns:jString="http://www.oracle.com/XSL/Transform/java/java.lang.String"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date"
                exclude-result-prefixes="c jmath jString">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:param name="language" />
  <xsl:param name="country" />
  <xsl:param name="countryCode" />
  <xsl:param name="APP_ROOT" />


  <xsl:template name="jmathCeil" >
    <xsl:param name="value" />
    <xsl:value-of select="jmath:ceil($value)"/>
  </xsl:template>

  <xsl:template name="util-formatDate" >
    <xsl:param name="value" />
    <xsl:value-of select="concat(substring($value,1, 4), '.',substring($value,5, 2),  '.',substring($value,7), '')"/>
  </xsl:template>


  <xsl:template match="c:master[@type='smoComPageMaster']">  
  <html lang="{$language}">
  	<head>
	  	<title>
	  		<xsl:value-of select="//c:page/c:title[position() = 1]" />
	  	</title>
      <link rel="icon" href="/images/favicon2.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="/images/favicon2.ico" type="image/x-icon" />
      
      <xsl:if test="normalize-space($country) != ''">
        <meta property="country" content="{$country}" />
      </xsl:if>
      <xsl:if test="normalize-space($countryCode) != ''">
        <meta property="countryCode" content="{$countryCode}" />
      </xsl:if>

      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/bootstrap/bootstrap.min.css" />
	  	<link rel="stylesheet" type="text/css" href="/RenderingAssets/css/reset.css" />
	  	<link rel="stylesheet" type="text/css" href="/RenderingAssets/css/global.css" />
	  	
	  	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-1.10.1.min.js"></script>	  	
	  	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-migrate-1.2.1.min.js"></script>


      <!-- Add mousewheel plugin (this is optional) -->
      <script type="text/javascript" src="/RenderingAssets/lib/fancyBox/jquery.mousewheel-3.0.6.pack.js"></script>

      <!-- Add fancyBox main JS and CSS files -->
      <script type="text/javascript" src="/RenderingAssets/lib/fancyBox/jquery.fancybox.js?v=2.1.5"></script>
      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/fancyBox/jquery.fancybox.css?v=2.1.5" media="screen" />

      <!-- Add Button helper (this is optional) -->
      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/fancyBox/jquery.fancybox-buttons.css?v=1.0.5" />
      <script type="text/javascript" src="/RenderingAssets/lib/fancyBox/jquery.fancybox-buttons.js?v=1.0.5"></script>

      <!-- Add Thumbnail helper (this is optional) -->
      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/fancyBox/jquery.fancybox-thumbs.css?v=1.0.7" />
      <script type="text/javascript" src="/RenderingAssets/lib/fancyBox/jquery.fancybox-thumbs.js?v=1.0.7"></script>

      <!-- Add Media helper (this is optional) -->
      <script type="text/javascript" src="/RenderingAssets/lib/fancyBox/jquery.fancybox-media.js?v=1.0.6"></script>
      
      
      <xsl:text disable-output-escaping="yes">
            <![CDATA[
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="/RenderingAssets/js/html5shiv.js"></script>
              <script src="/RenderingAssets/js/respond.min.js"></script>
            <![endif]-->
            ]]>
      </xsl:text>
      
      <link rel="stylesheet" type="text/css" href="/RenderingAssets/lib/jCarousel/jcarousel.responsive.css"/>
      <link rel="stylesheet" href="/RenderingAssets/lib/caroufredsel/caroufredsel.css" type="text/css" />

      <!--script src="http://jwpsrv.com/library/02YIiKJ2EeOigiIACi0I_Q.js"></script-->

      <!-- AddThis Smart Layers BEGIN -->
      <!-- Go to http://www.addthis.com/get/smart-layers to customize -->
      <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52cbb19d138551fd"></script>
      <script type="text/javascript">
        addthis.layers({
        'theme' : 'transparent',
        'share' : {
        'position' : 'left',
        'services' : 'baidu,sinaweibo,kaixin,email,print,more'
        /*'numPreferredServices' : 6*/
        }
        });
      </script>
      <!-- AddThis Smart Layers END -->

      <script type="text/javascript">
        $(function(){
        $(".various").fancybox({
        maxWidth	: 800,
        maxHeight	: 600,
        fitToView	: false,
        width		: '70%',
        height		: '70%',
        autoSize	: false,
        closeClick	: false,
        openEffect	: 'none',
        closeEffect	: 'none'
        });
        });
      </script>
    </head>
  	<body>
	  	<div>
	  		<xsl:for-each select="c:column">
					<div class="col">
							<xsl:for-each select="c:row">
								<div class="ro">
                  <xsl:if test="normalize-space(@style) != ''">
                    <xsl:attribute name="style">
                      <xsl:value-of select="@style"/>
                    </xsl:attribute>
                  </xsl:if>
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

<h1 style="display:none;">
	<xsl:value-of select="$APP_ROOT" />
</h1>
      <script type="text/javascript" src="/RenderingAssets/lib/bootstrap/bootstrap.min.js"></script>
      <script type="text/javascript" src="/RenderingAssets/lib/jCarousel/jquery.jcarousel.min.js"></script>
      <script src="/RenderingAssets/lib/caroufredsel/jquery.caroufredsel.js" type="text/javascript"></script>
    </body>
  </html>
  </xsl:template>
</xsl:stylesheet>  