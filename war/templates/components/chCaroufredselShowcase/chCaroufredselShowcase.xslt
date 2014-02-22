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
      <!--
      <div class="moduletable video">
        <div class="mod_caroufredsel mod_caroufredsel__video">
          <div id="list_carousel_carousel2" class="list_carousel">

            <ul id="caroufredsel_carousel2">
              
            </ul>

            <div id="carousel_carousel2_prev" class="caroufredsel_prev">
              <span></span>
            </div>
            <div id="carousel_carousel2_next" class="caroufredsel_next">
              <span></span>
            </div>

            <div id="carousel_carousel2_pag" class="caroufredsel_pagination"></div>
            <div class="clearfix"></div>
          </div>
        </div>

        <script type="text/javascript">
          <![CDATA[
          if (jQuery.browser.msie && jQuery.browser.version < 9) {
                  jQuery(document).ready(function () {

                      var carouselConteiner = jQuery("#caroufredsel_carousel2");

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
                              queue: true
                          },
                          auto: true,
                          direction: 'right',
                          next: "#carousel_carousel2_next",
                          prev: "#carousel_carousel2_prev",
                          swipe: {
                              onTouch: true
                          }
                      });
                  });
              } else {
                  jQuery(window).load(function () {

                      var carouselConteiner = jQuery("#caroufredsel_carousel2");

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
                              queue: true
                          },
                          auto: true,
                          direction: 'right',
                          next: "#carousel_carousel2_next",
                          prev: "#carousel_carousel2_prev",
                          swipe: {
                              onTouch: true
                          }
                      });
                  });
              }]]>
        </script>
      </div>
      -->
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
                    <a href="{c:link}">
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
                              queue: true
                          },
                          auto: true,
                          direction: ']]><xsl:value-of select="$direction"/><![CDATA[',
                          next: "#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next",
                          prev: "#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev",
                          swipe: {
                              onTouch: true
                          }
                      });
                  });
              } else {
                  jQuery(window).load(function () {

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
                              queue: true
                          },
                          auto: true,
                          direction: ']]><xsl:value-of select="$direction"/><![CDATA[',
                          next: "#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_next",
                          prev: "#carousel_carousel]]><xsl:value-of select="$caroufredsel_id"/><![CDATA[_prev",
                          swipe: {
                              onTouch: true
                          }
                      });
                  });
              }]]>
      </script>
    </div>
  </xsl:template>
</xsl:stylesheet>  