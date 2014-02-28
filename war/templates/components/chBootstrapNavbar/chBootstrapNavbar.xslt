<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:c="http://com.snnmo.website"
                exclude-result-prefixes="c">
  <xsl:output method="html" indent="yes"/>
  
  <xsl:template match="c:component[@type='chBootstrapNavbar']">
    <div class="chBootstrapNavbar navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand hidden-sm" href="/">神猫</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li>
              <a href="/">首页</a>
            </li>
            <li class="dropdown">
              <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                Bootstrap2中文文档<b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li class="">
                  <a href="http://v2.bootcss.com/getting-started.html" target="_blank">起步</a>
                </li>
                <li class="">
                  <a href="http://v2.bootcss.com/scaffolding.html" target="_blank">脚手架</a>
                </li>
                <li class="">
                  <a href="http://v2.bootcss.com/base-css.html" target="_blank">基本CSS样式</a>
                </li>
                <li class="">
                  <a href="http://v2.bootcss.com/components.html" target="_blank">组件</a>
                </li>
                <li class="">
                  <a href="http://v2.bootcss.com/javascript.html" target="_blank">JavaScript插件</a>
                </li>
                <li class="">
                  <a href="http://v2.bootcss.com/customize.html" target="_blank">定制</a>
                </li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                Bootstrap3中文文档<b class="caret"></b>
              </a>
              <ul class="dropdown-menu">
                <li>
                  <a href="http://v3.bootcss.com/getting-started/" target="_blank">起步</a>
                </li>
                <li>
                  <a href="http://v3.bootcss.com/css/" target="_blank">CSS</a>
                </li>
                <li>
                  <a href="http://v3.bootcss.com/components/" target="_blank">组件</a>
                </li>
                <li>
                  <a href="http://v3.bootcss.com/javascript/" target="_blank">JavaScript插件</a>
                </li>
                <li>
                  <a href="http://v3.bootcss.com/customize/" target="_blank">定制</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="/mockup/index.shtml" target="_blank">网页模板</a>
            </li>
            <li>
              <a href="/blog/index.shtml" target="_blank">个人博客</a>
            </li>
            <li>
              <a href="about.html">关于</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>  