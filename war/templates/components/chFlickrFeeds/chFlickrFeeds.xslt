<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="photoset_id" />
  <xsl:param name="photoset_name" />
  
  <xsl:template match="c:component[@type='chFlickrFeeds']">
  	<!-- http://api.flickr.com/services/rest/?method=flickr.photosets.getList&api_key=5e1428ad1828de40e0969cae48143af8&user_id=105589116@N06 -->
    

    <xsl:if test="normalize-space($photoset_id) != ''">
      <link href="/RenderingAssets/components/chFlickrFeeds/chFlickrFeeds.css" type="text/css" rel="stylesheet" />

        <h2>
          <xsl:value-of select="$photoset_name"/>
        </h2>
  	    <div class="chFlickrFeeds" id="{@componentId}">
          <xsl:variable name="flickrFeeds" 
                        select="document(concat('http://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&amp;api_key=5e1428ad1828de40e0969cae48143af8&amp;photoset_id=', $photoset_id))" />

          <xsl:for-each select="$flickrFeeds/rsp/photoset/photo">
            <div class="item">
              <div class="containe-wapper">
                <!--http://farm4.staticflickr.com/3800/12605839173_7632607f5a.jpg-->
                <!-- concat('http://farm',@farm,'.staticflickr.com/',@server,'/',@primary,'_',@secret,'_m.jpg') -->
                <xsl:variable name="imageUrl" select="concat('http://farm',@farm,'.staticflickr.com/',@server,'/',@id,'_',@secret)" />
                <a style="display:block;height:100%;" href="{concat($imageUrl,'_b.jpg')}" target="_blank">
                  <div class="mockup" style="background-image:url({concat($imageUrl,'_m.jpg')});">
            
                  </div>
                </a>
              </div>
              <span style="display:block;">
                <xsl:value-of select="description"/>
                <xsl:if test="normalize-space(description) = ''">
                  <xsl:value-of select="title"/>
                </xsl:if>
              </span>
            </div>
          </xsl:for-each>
  	    </div>

    </xsl:if>
  </xsl:template>
</xsl:stylesheet>  