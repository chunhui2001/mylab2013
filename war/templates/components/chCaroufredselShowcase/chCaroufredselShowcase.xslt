<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chCaroufredselShowcase']">


    <!-- Showcase 47853 -->
  	<div class="chCaroufredselShowcase showcase-row" id="{@componentId}">      
      <xsl:for-each select="c:caroufredsel">
        <xsl:call-template name="chCaroufredselShowcase-build">
          <xsl:with-param name="caroufredsel" select="current()" />
          <xsl:with-param name="caroufredsel_index" select="position()" />
          <xsl:with-param name="component_id" select="../@componentId" />
        </xsl:call-template>
      </xsl:for-each>      
  	</div>


  </xsl:template>

  <xsl:template name="chCaroufredselShowcase-build">
    <xsl:param name="caroufredsel" />
    <xsl:param name="caroufredsel_index" />
    <xsl:param name="component_id" />

    <xsl:variable name="caroufredsel_id" select="concat('_',$component_id, '_', $caroufredsel_index)" />
    
    <div class="moduletable video">
      <div class="mod_caroufredsel mod_caroufredsel__video">
        <div id="list_carousel_carousel{$caroufredsel_id}" class="list_carousel">

          <ul id="caroufredsel_carousel{$caroufredsel_id}">

            <xsl:for-each select="$caroufredsel/c:image">
              <li class="item">
                <div class="item_content">
                  <!-- Intro Image -->
                  <div class="item_img img-intro img-intro__none">
                    <a class="fancybox" href="{c:big}" target="_blank">
                      <img src="{c:src}" alt="{c:title}" />
                    </a>
                  </div>
                  <!-- Read More link -->
                </div>
              </li>
            </xsl:for-each>
          </ul>

          <xsl:text disable-output-escaping="yes"><![CDATA[
          <div id="carousel_carousel]]></xsl:text><xsl:value-of select="$caroufredsel_id"/><xsl:text disable-output-escaping="yes"><![CDATA[_prev" class="caroufredsel_prev">
            <span></span>
          </div>
          <div id="carousel_carousel]]></xsl:text><xsl:value-of select="$caroufredsel_id"/><xsl:text disable-output-escaping="yes"><![CDATA[_next" class="caroufredsel_next">
            <span></span>
          </div>

          <div id="carousel_carousel]]></xsl:text><xsl:value-of select="$caroufredsel_id"/><xsl:text disable-output-escaping="yes"><![CDATA[_pag" class="caroufredsel_pagination"></div>
          ]]></xsl:text>
          <div class="clearfix"></div>
        </div>
      </div>

      <xsl:variable name="direction">
        <xsl:choose>
          <xsl:when test="$caroufredsel_index mod 2 = 0">
            <xsl:value-of select="'right'"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'left'"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <script type="text/javascript">
        <![CDATA[
          if (jQuery.browser.msie && jQuery.browser.version < 9) {
                  jQuery(document).ready(function () {
                     // $('.fancybox').fancybox();

                      var carouselConteiner = jQuery("#caroufredsel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[");

                      carouselConteiner.carouFredSel({
                          responsive: true,
                          width: '100%',
                          items: {
                              width: 385,
                              height: 'variable',
                              visible: {
                                  min: 1,
                                  max: 5
                              },
                              minimum: 1
                          },
                          scroll: {
                              items: 1,
                              fx: "scroll",
                              easing: "swing",
                              duration: 500,
                              queue: true,
                              pauseOnHover: true
                          },
                          auto: true,
                          direction: ']]><xsl:value-of select="$direction"/><![CDATA[',
                          next: {button:"#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next",key:'right',onAfter:function() {  } },
                          prev: {button:"#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev",key:'left',onAfter:function() {  } },
                          swipe: {
                              onTouch: true
                          }
                      });
                      
                      
                      $("#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next").bind("click", function() {
                          // change direction to right
                         // $(carouselConteiner).carouFredSel({ direction:'right' });
                         $(carouselConteiner).trigger( 'configuration', [ 'direction', "left" ] );
                      });
                      $("#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev").bind("click", function() {
                          // change direction to left
                          //$(carouselConteiner).carouFredSel({ direction:'left' });
                         $(carouselConteiner).trigger( 'configuration', [ 'direction', "right" ] );
                      });
                  });
              } else {
                  jQuery(window).load(function () {
                    //  $('.fancybox').fancybox();

                      var carouselConteiner = jQuery("#caroufredsel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[");

                      carouselConteiner.carouFredSel({
                          responsive: true,
                          width: '100%',
                          items: {
                              width: 385,
                              height: 'variable',
                              visible: {
                                  min: 1,
                                  max: 5
                              },
                              minimum: 1
                          },
                          scroll: {
                              items: 1,
                              fx: "scroll",
                              easing: "swing",
                              duration: 500,
                              queue: true,
                              pauseOnHover: true
                          },
                          auto: true,
                          direction: ']]><xsl:value-of select="$direction"/><![CDATA[',
                          next: {button:"#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next",key:'right',onAfter:function() {  } },
                          prev: {button:"#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev",key:'left',onAfter:function() {  } },
                          swipe: {
                              onTouch: true
                          }
                      });
                      
                      
                      $("#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next").bind("click", function() {
                          // change direction to right
                         // $(carouselConteiner).carouFredSel({ direction:'right' });
                         $(carouselConteiner).trigger( 'configuration', [ 'direction', "left" ] );
                      });
                      $("#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev").bind("click", function() {
                          // change direction to left
                          //$(carouselConteiner).carouFredSel({ direction:'left' });
                         $(carouselConteiner).trigger( 'configuration', [ 'direction', "right" ] );
                      });
                  });
              }
              
              
              
              ]]>
      </script>
    </div>
  </xsl:template>
</xsl:stylesheet>  