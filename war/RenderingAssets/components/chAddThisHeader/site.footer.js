$(function () {
    $(window).scroll(function () {
        if ($(window).width() > 768) {
            if ($(window).scrollTop() <= 101) {
                $(".topbar").removeClass("alt")
            } else {
                $(".topbar").addClass("alt")
            }
        }
    });
    $(".mobile-menu").click(function (b) { b.preventDefault(); $("body > header .nav-left").toggleClass("nav-toggle") });
   /* addthis.addEventListener("addthis.bar.show", function () {
        if (($(".addthis_bar_container").height() > 0) && location.pathname !== "/get/welcome") {
            $("body").addClass("wb-body")
        }
    });*/

    $(".btn-nav-gtc").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-button"]); document.location.href = "/get/smart-layers"
    });
    $(".nav-gtc-link").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-mobile-link"])
    });
    $(".gopro-user-drop").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/gopro"])
    });
    $(".nav-btn-smartlayers").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-btn-smartlayers"])
    });
    $(".nav-btn-sharing").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-btn-sharing"])
    });
    $(".nav-btn-follow").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-btn-follow"])
    });
    $(".nav-btn-welcome").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-btn-welcome"])
    });
    $(".nav-btn-trending").click(function () {
        _gaq.push(["_trackPageview", "/tracker/topnav/GTC-nav-btn-trending"])
    });
    $(".btn-at5promo").click(function () {
        _gaq.push(["_trackPageview", "/tracker/pro/site-promo-btn"]);
        _gaq.push(["_trackPageview", "/tracker/pro/trial"])
    });
    $(".logoutAnchor").on("click", function (b) {
        b.preventDefault();
        $.get("/logout", function () { window.close() })
    });
    $(document).mouseup(function (b) {
        var c = $(".drop-user");
        if (c.has(b.target).length === 0) {
            $("a.user").removeClass("nav-highlight"); c.hide()
        }
    });
    $(".nav-user-auth").click(function (b) {
        b.preventDefault();
        $(".drop-user").toggle()
    });
    $(".header-drop-inner a").click(function () {
        $(".header-drop").hide()
    });
    $("#at-gsm").mouseover(function () {
        $(this).data("is_hovered", true);
        window.setTimeout(function () {
            if ($("#at-gsm").data("is_hovered")) { $("#at-gsm ul").slideDown("fast") }
        }, 100)
    });
    $("#at-gsm").mouseout(function () {
        $(this).data("is_hovered", false);
        if ($(this).data("timeout")) {
            window.clearTimeout($(this).data("timeout"))
        }
        $(this).data("timeout", window.setTimeout(function () {
            if (!$("#at-gsm").data("is_hovered")) {
                $("#at-gsm ul").slideUp("fast")
            }
        }, 500))
    }); var a = false;
    $(".start-free-trial").on("click", function (b) {
        b.preventDefault(); if (!a) {
            a = true;
           /* if (document.domain === "www.addthis.com") {
                $.getScript("https://bellbot.com/js/?code=1635868112")
            }*/
            _gaq.push(["_trackPageview", "/tracker/pro/trial"]);
            _gaq.push(["_trackPageview", "/tracker/pro-page/big-button"]);
            setTimeout(function () {
                document.location.href = "/pro/start-trial"
            }, 400)
        }
    })
});
function ToggleNavGtc(a) {
    if (a) {
        $("#nav-gtc-li").hide(); $("#nav-options-create-acct").hide(); $("#nav-options-gtc").show(); $(".drop-user").addClass("drop-auth")
    } else { $("#nav-gtc-li").show(); $("#nav-options-create-acct").show(); $("#nav-options-gtc").hide() } $(".topnav, .topnav-options").fadeTo(1000, 1)
}
var doCrazyegg = (typeof (doCrazyegg) === "undefined") ? (Math.floor(Math.random() * (175 - 1 + 1)) === 1) : doCrazyegg;
if (doCrazyegg) {
    setTimeout(function () {
        var d = document.createElement("script");
        var c = document.getElementsByTagName("script")[0];
        d.src = document.location.protocol + "//dnn506yrbagrg.cloudfront.net/pages/scripts/0012/0247.js?" + Math.floor(new Date().getTime() / 3600000);
        d.async = true; d.type = "text/javascript"; c.parentNode.insertBefore(d, c)
    }, 1)
};