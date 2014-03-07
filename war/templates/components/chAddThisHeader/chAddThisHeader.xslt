<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chAddThisHeader']">

    <!--link rel="alternate" type="application/rss+xml" href="http://www.addthis.com/blog/?feed=rss2" title="AddThis Blog Feed" /-->

    <link rel="stylesheet" type="text/css" media="all" href="/RenderingAssets/components/chAddThisHeader/site.css" />
    <link rel="stylesheet" type="text/css" media="all" href="/RenderingAssets/components/chAddThisHeader/common.css" />
    <!--link rel="stylesheet" type="text/css" media="all" href="http://cache.addthiscdn.com/www/140306126825/style/shared/bootstrap3.custom.min.css" /-->
    <link href="/RenderingAssets/components/chAddThisHeader/homepage.css" media="screen" rel="stylesheet" type="text/css" />

    



    <header class="topbar animated" role="navigation">
      <div class="container clearfix">
        <a class="addthis-logo" href="/index.shtml" title="AddThis">AddThis</a>
        <nav>
          <ul class="nav-left">
            <li class="nav-gtc-link">
              <a href="/get">Get the Code</a>
            </li>
            <li>
              <a class="nav-whatwedo" href="/what-we-do" title="Learn about our website tools, advertising solutions and data">What We Do</a>
            </li>
            <li>
              <a class="nav-support" href="http://support.addthis.com/" title="Ask questions or browse documentation">Support</a>
            </li>
            <li>
              <a class="nav-blog" href="/blog" title="News and updates from AddThis.com">Blog</a>
            </li>
            <li>
              <a class="nav-settings" href="/settings/user" title="Your AddThis account settings">Settings</a>
            </li>
            <li>
              <a class="nav-signout" href="/logout" title="Sign Out">Sign Out</a>
            </li>
          </ul>
          <ul class="nav-right">
            <li>
              <a class="nav-analytics" href="/analytics" title="Track how your site is working with social analytics">Analytics</a>
            </li>
            <!--li>
              <a class="nav-user-auth" href="/settings" title="Your AddThis account settings">Settings</a>
            </li-->
            <li class="nav-dropbtn">
              <div class="btn-group" title="Get multiple mobile-ready tools with one piece of code">
                <button type="button" class="btn btn-nav-gtc dropdown-toggle" data-toggle="dropdown">
                  Get the Code <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                  <li>
                    <a class="nav-btn-smartlayers" href="/get/smart-layers">Smart Layers</a>
                  </li>
                  <li>
                    <a class="nav-btn-sharing" href="/get/sharing">Share Buttons</a>
                  </li>
                  <li>
                    <a class="nav-btn-follow" href="/get/follow">Follow Buttons</a>
                  </li>
                  <li>
                    <a class="nav-btn-welcome" href="/get/welcome">Welcome Bar</a>
                  </li>
                  <li>
                    <a class="nav-btn-trending" href="/get/trending">Trending Content</a>
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </nav>
        <div class="header-drop drop-user">
          <span class="header-drop-caret"></span>
          <!--
          <div class="header-drop-inner">
            <ul>
              <li>
                <b>Hi, chunhui2001@gmail.com</b>
              </li>
              <li>
                <a class="gopro-user-drop" href="/pro">
                  Go <span class="pro-badge">Pro</span>
                </a>
              </li>

                <li>
                  <a href="/settings/user" title="Your AddThis account settings">Settings</a>
                </li>
                <li>
                  <a href="/logout" title="Sign out">Sign Out</a>
                </li>
              </ul>
          </div>
          -->
        </div>
        <button type="button" class="mobile-menu">
          <span class="mobile-menu-bar"></span>
          <span class="mobile-menu-bar"></span>
          <span class="mobile-menu-bar"></span>
        </button>
      </div>
    </header>

    <script type="text/javascript">
      $(function(){
      $("header .mobile-menu").bind("click", function(){
      
      if($(".nav-left").is(":hidden")){
      $(".nav-left").show();

      } else {
      $(".nav-left").hide();
      }

      });
      });
    </script>

    <div id="maincontent">
      <section class="banner" role="banner">

      </section>
    </div>




    <!--script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-1.10.1.min.js"></script>	  	
	  	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-migrate-1.2.1.min.js"></script-->

    <script type="text/javascript" src="/RenderingAssets/components/chAddThisHeader/site.footer.js"></script>
    <script type="text/javascript" src="/RenderingAssets/lib/bootstrap/bootstrap.hover.dropdown.js"></script>


  </xsl:template>
</xsl:stylesheet>  