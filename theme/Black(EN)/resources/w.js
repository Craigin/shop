try{!function(){function e(e){var t=document.createElement("a");return t.href=e,t}function t(){window.addEventListener("message",function(t){var a=t.origin||t.originalEvent.origin,r=e(a);if(r&&o(r.hostname)){var c=t.data;"LO::APPID"===c.type&&n(c.appid)}})}function o(e){return null!=e&&(e=e.toLowerCase(),e=e.replace("www.",""),e=e.replace("ssl.",""),e=e.replace("w1.",""),"luckyorange.com"===e||"livestatserver.com"===e)}function n(e){if(r)return!1;e=e||"clickstream",clearTimeout(c),r=!0,e&&i.hasOwnProperty(e)&&(d=i[e]),window.module&&(window.module.exports={});var t=document.location.href.indexOf("#_lo_orz")>-1||document.location.href.indexOf("luckyorange.com/proxy_html.php")>-1;try{window.top&&"LO_Heatmap"in window.top&&(t=!0)}catch(o){}if(t===!1&&null==window.__lo_cs_added){window.__lo_cs_added=!0;var n=window.localStorage,l=n.getItem("lo::dbg_url");l&&(d=l),a(d,function(){l&&console.log("[LO] w.js: Loaded app",e,"from path",l)})}}function a(e,t){try{if(!e)return;var o=document.head||document.getElementsByTagName("head")[0]||document.documentElement,n=document.createElement("script");n.async=!0,n.charset="utf-8",n.type="text/javascript",n.src=e,n.crossOrigin="anonymous",n.onload=n.onreadystatechange=function(e,o){(o||!n.readyState||/loaded|complete/.test(n.readyState))&&(n.onload=n.onreadystatechange=null,"function"==typeof t&&t())},o.insertBefore(n,o.firstChild)}catch(a){}}var r=!1,c=0,i={clickstream:"https://d10lpsik1i8c69.cloudfront.net/js/clickstream.js",heatmap:"https://d10lpsik1i8c69.cloudfront.net/heatmap/production/app.js"},d=i.clickstream;if(window.opener){t(),c=setTimeout(n,2500);var l={type:"LO::APPID"};window.opener.postMessage(l,"*")}else n()}()}catch(excep1){}