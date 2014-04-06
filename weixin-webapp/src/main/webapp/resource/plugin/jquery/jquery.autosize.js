/* Copyright (c) 2012 sunju
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version 1.0.0
 */
;(function($){$.fn.autosize=($.browser.msie&&/msie 6\.0/i.test(navigator.userAgent)?function(){return this.each(function(){var w=$(this).width(),h=$(this).height();var dw=$(this).css("max-width");var dh=$(this).css("max-height");dw=parseInt(dw)||dw;dh=parseInt(dh)||dh;if(dw){if(w>dw&&(!dh||dw*h/w<=dh)){$(this).css("width",dw+"px")}}if(dh){if(h>dh&&(!dw||dh*w/h<=dw)){$(this).css("height",dh+"px")}}})}:function(){return this})})(jQuery);