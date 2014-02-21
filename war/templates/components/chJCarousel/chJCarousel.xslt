<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="photoset_id" />
  <xsl:param name="photoset_name" />
  
  <xsl:template match="c:component[@type='chJCarousel']">

    <!--http://sorgalla.com/jcarousel/-->
    <!--script type="text/javascript" src="/RenderingAssets/lib/jCarousel/jcarousel.responsive.js"></script-->

    <xsl:if test="normalize-space($photoset_id) = ''">
    
      <style type="text/css">
        <![CDATA[
        .jcarousel-pagination {width:100%;display:none;}
        .jcarousel ul { width: 200000em;}
        ]]>
      </style>
    
  	  <div class="chJCarousel" id="{@componentId}">
        <xsl:variable name="flickrFeeds" select="document(c:feeds)" />

      
      
      
      
        <div class="jcarousel-wrapper" style="margin:auto;">
          <div class="jcarousel" style="height:{c:size/@height};">
            <ul style="height:100%;">

              <xsl:for-each select="$flickrFeeds/rsp/photosets/photoset">
                <xsl:variable name="imageUrl" select="concat('http://farm',@farm,'.staticflickr.com/',@server,'/',@primary,'_',@secret)" />
                <li style="height:100%;">
                  <xsl:variable name="description">
                    <xsl:value-of select="description"/>
                    <xsl:if test="normalize-space(description) = ''">
                      <xsl:value-of select="title"/>
                    </xsl:if>
                  </xsl:variable>
                  
                  <a href="/mockup/index.shtml?photoset_id={@id}&amp;photoset_name={normalize-space($description)}" target="_blank" style="display:block;height:100%;"> 
                    <img style="width:100%;height:100% !important;" src="{concat($imageUrl,'_m.jpg')}" alt="Image 1" />
                  </a>
                  <h4 style="position:relative;margin-top:-2em;background-color:rgba(86, 81, 81, 0.8);color:white;padding:.27em .8em; ">
                    <xsl:value-of select="$description"/>        
                  </h4>
                </li>
              </xsl:for-each>

              <!--li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img1.jpg" alt="Image 1" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img2.jpg" alt="Image 2" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img3.jpg" alt="Image 3" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img4.jpg" alt="Image 4" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img5.jpg" alt="Image 5" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img6.jpg" alt="Image 6" />
              </li>
              <li>
                <img src="http://sorgalla.com/jcarousel/examples/_shared/img/img1.jpg" alt="Image 1" />
              </li-->
              <div class="clear"></div>
            </ul>
          </div>

          <a href="#" class="jcarousel-control-prev">&#8249;</a>
          <a href="#" class="jcarousel-control-next">&#8250;</a>

          <p class="jcarousel-pagination"></p>
        </div>
  	  </div>

      <script type="text/javascript">
        <![CDATA[
          (function($) {
            $(function() {
                var jcarousel = $('.jcarousel');

                jcarousel
                    .on('jcarousel:reload jcarousel:create', function () {
                        var width = jcarousel.innerWidth();

                        if (width >= 900) {
                            width = width / 6;
                        } else if (width >= 600) {
                            width = width / 4;
                        } else if (width >= 350) {
                            width = width / 2;
                        }

                        jcarousel.jcarousel('items').css('width', width + 'px');
                    })
                    .jcarousel({
                        wrap: 'circular'
                    });

                $('.jcarousel-control-prev')
                    .jcarouselControl({
                        target: '-=1'
                    });

                $('.jcarousel-control-next')
                    .jcarouselControl({
                        target: '+=1'
                    });

                $('.jcarousel-pagination')
                    .on('jcarouselpagination:active', 'a', function() {
                        $(this).addClass('active');
                    })
                    .on('jcarouselpagination:inactive', 'a', function() {
                        $(this).removeClass('active');
                    })
                    .on('click', function(e) {
                        e.preventDefault();
                    })
                    .jcarouselPagination({
                        perPage: 1,
                        item: function(page) {
                            return '<a href="#' + page + '">' + page + '</a>';
                        }
                    });
            });
        })(jQuery);
        ]]>
      </script>

    </xsl:if>
  </xsl:template>
</xsl:stylesheet>  