/**
 * flexo-site-profile - A dead simple, responsive & flexible boilerplate.
 * @version v0.12.29
 * @link    http://getflexo.com
 * @author   ()
 * @license MIT
 */
(function(){var Soyjavi;window.Soyjavi=Soyjavi={version:"1.09.01"},Soyjavi.effect=function(){var resize,scroll,_el;return _el={page:$(window),document:$(document),header:$("header"),landing:$(".landing > .row"),more:$(".landing .more")},resize=function(){return _el.landing.height($(window).height())},scroll=function(){var percent;return percent=100*_el.document.scrollTop()/_el.landing.height(),percent>10?_el.more.addClass("hide"):_el.more.removeClass("hide"),percent>25?(_el.header.addClass("active"),_el.landing.addClass("hide"),_el.landing.parent().removeClass("scroll")):(_el.landing.removeClass("hide"),_el.header.removeClass("active"),_el.landing.parent().addClass("scroll"))},{resize:resize,scroll:scroll}}(Soyjavi),$(function(){return Soyjavi.effect.resize(),$(window).on("resize",Soyjavi.effect.resize),$(document).on("scroll",Soyjavi.effect.scroll),$(window).stellar()})}).call(this);