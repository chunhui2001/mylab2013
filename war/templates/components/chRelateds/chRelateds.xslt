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

    <h1>ddd</h1>

  </xsl:template>
</xsl:stylesheet>  