(function($) {
    $.fn.userCard = function(options) {
        var defaults = {
            status: 'on',
            cardid: 'space_card',
            cardAPI: 'home/Space/showSpaceCard',
            cardTpl: ' <div class="starcoment_Box_a">' + ' <div class="card-arrow"></div>' + '  <div class="sp_coment">' + '    <div class="coment_D">' + '      <span class="fl mt04">' + '       <a href="{space_url}"><img onerror="this.onerror=null;this.src=\'http://nuc.m1905.com/images/noavatar_small.gif\'"  src="{face}"  title="{uname}" uid="{uid}" imgtype="head" height="40" width="40" /></a>' + '      </span>' + '       <dl class="sar_Info">' + '     <p><a href="{space_url}">{uname}</a> ' + '  </p>' + '    <p class="gray_f01"><a href="#">{location}</a></p>' + '    <p class="blue_d"><a href="{following_url}">鍏虫敞:({followed_count})</a> | <a href="{follower_url}">绮変笣:(<span id="flw_counter_{uid}">{followers_count}</span>)</a> | <a href="{space_url}">鍙彯:({weibo_count})</a></p>' + '  <p  class="mt05">{tags}</p>' + '  <p class="botton mt10 ta_r" id="space_card_toolbar"><br />' + '  ' + ' </p>' + '     </dl>' + '     </div>' + '   </div>' + '    </div>',
            stcardTpl: ' <div class="starcoment_Box_a">' + ' <div class="card-arrow"></div>' + '  <div class="sp_coment">' + '      <div class="coment_D">' + '      <span class="fl mt04">' + '       <a href="{space_url}"><img onerror="this.onerror=null;this.src=\'http://nuc.m1905.com/images/noavatar_small.gif\'"  src="{face}"  title="{uname}" uid="{uid}" imgtype="head" height="40" width="40" /></a>' + '      </span>' + '       <dl class="sar_Info">' + '     <p><a href="{space_url}">{uname}</a> ' + '  </p>' + '    <p class="blue_d"> 绮変笣:(<span id="flw_counter_{uid}">{followers_count}</span>)| 鍙彯:({weibo_count})</p>' + '  <p  class="mt05">鍑虹敓鏃ユ湡:{birthday}</p>' + '  <p  class="mt05">鍥界睄:{nation}</p>' + '  <p  class="mt05">鏄熷骇:{constellation}</p>' + '  <p class="botton mt10 ta_r" id="FS_card_toolbar"><br />' + '  ' + ' </p>' + '     </dl>' + '     </div>' + '   </div>' + '    </div>',
            fcardTpl: ' <div class="starcoment_Box_a">' + ' <div class="card-arrow"></div>' + '  <div class="sp_coment">' + '   <div class="coment_D">' + '      <span class="fl mt04">' + '       <a href="{space_url}"><img onerror="this.onerror=null;this.src=\'http://nuc.m1905.com/images/noavatar_small.gif\'"  src="{face}"  title="{uname}" uid="{uid}" imgtype="head" height="40" width="40" /></a>' + '      </span>' + '       <dl class="sar_Info">' + '     <p><a href="{space_url}">{uname}</a> ' + '  </p>' + '    <p class="blue_d">鍠滄:(<span id="flw_counter_{uid}">{love_count}</span>) | 鍙彯:({weibo_count})</p>' + '  <p  class="mt05">鍦板尯:{clime}</p>' + '  <p  class="mt05">绫诲瀷:{mtype}</p>' + '  <p  class="mt05">涓绘紨:{starring}</p>' + '  <p class="botton mt10 ta_r" id="FS_card_toolbar" ><br />' + '  ' + ' </p>' + '     </dl>' + '     </div>' + '   </div>' + '    </div>',
            nocardTpl: ' <div class="starcoment_Box_a">' + ' <div class="card-arrow"></div>' + '  <div class="sp_coment">' + '      <div class="coment_D">' + '       <dl class="sar_Info">' +

            '  <p  class="mt05">{msg}</p>' + '     </dl>' + '     </div>' + '   </div>' + '    </div>'
        }
        var options = $.extend(defaults, options);
        
        var _this = this;
        var element;
        _this.t = null;
        _this.v = null;

        if (!element) {
            element = $("<div/>").css({
                display: 'none',
                position: 'absolute',
                'z-index': 10240  //edit by wangting
            }).attr('id', options.cardid + '_content').appendTo(document.body).bind('mouseenter',
            function() {
                clearTimeout(_this.v);
            }).bind('mouseleave',
            function() {
                $(this).hide();
            }).show();
        }

        var $cardbox = $('#' + options.cardid + '_content');
        var userInfoList = {}, postion;
        layerTimer = setTimeout(function(){
            for ( var k in userInfoList){
                delete userInfoList[k];
            }
        }, 60*1000); 
        $(this).live('mouseover', function(e) {
            $(this).css("display","inline-block");
            if ($(this)[0].className && $(this)[0].className.indexOf('nocard') > -1) return false;

            clearTimeout(_this.v);
            var width = $(this).width();
            var height = $(this).height();
            var position = $(this).offset();
            position.width = width;
            position.height = height;

            var uid = $(this).attr('uid') || $(this).attr('fid') || $(this).data('uid'),
            weiboid = $(this).data('weiboid'),
            ftype = $(this).attr('ftype');
            if (!uid) return;
            _this.t = setTimeout(function() {
                var topTrail = _this.layout(position,height);
                $cardbox.html(' <div class="starcoment_Box_b"><img src="' + _PUBLIC_ + '/js/tbox/images/icon_waiting.gif" width="20"></div>');
                if (uid) {
                    if(options.cardid=='FS_card'){
                        var params = ['fid=' + uid, 'ftype=' + ftype];
                    }else if(options.cardid=='topic_card'){
                        var params = ['weiboid=' + weiboid];
                    }else{
                        var params = ['uid=' + uid];
                    }
                    if( userInfoList[uid] ){
                        _this.parseShow(userInfoList[uid], topTrail);
                    }else{
                    _this.ajax = $.getJSON(U(options.cardAPI, params),
                    function(result) {
                        if (result.status) {
                            var data = result.data || result, uid = data.uid;
                            userInfoList[uid] = data;
                            _this.parseShow(userInfoList[uid], topTrail);
                        } else {
                            _this.parsenoShow(topTrail);
                        }
                    });
                    }
                };
            },200);
        e.stopPropagation();
        }).live('mouseout', function(event) {
            clearTimeout(_this.t);
            _this.v = setTimeout(function() {
                if (_this.ajax) _this.ajax.abort();
                $cardbox.hide();
            },
            100);
        });

        _this.parseShow = function(data, t) {
            var uid = data.uid, tpl;
            switch (data.datatype){
                case 2: 
                tpl = 'stcardTpl'; 
                break;
                case 1: 
                tpl = 'fcardTpl'; 
                break;
                default:
                tpl = 'cardTpl';
            }
            parseHtml = options[tpl].replace(/\{(.+?)\}/gi, function(s, t) {
                var type = s.replace('{', '').replace('}', '');
                if(type == 'fav_text'){
                    return /^un/.test(data['fav_status']) ? '' : '';
                }
                return data[type];
            });
            $cardbox.html(parseHtml).animate({
                opacity: 'show', 
                top: t
            },400);
			if(data.love_state ==1){
				data.follow_state='yes_love';
			}else if(data.love_state ==0){
				data.follow_state='no_love';
			}
            $('#' + options.cardid + '_toolbar').html(followState(data.follow_state, 'dolistfollow', uid,'',data.star_film_id)).on('change', function(e, id){
                userInfoList[id] && delete userInfoList[id];
            });
        }

        _this.parsenoShow = function(t) {
            parseHtml = options['nocardTpl'].replace(/\{(.+?)\}/gi,
            function(s, t) {
                var type = s.replace('{', '').replace('}', '');
                return '';
            });
            $cardbox.html(parseHtml).animate({
                opacity: 'show', 
                top: t
            },400);
        }

        _this.layout = function(position,height) {
            var topTrail;
            var winWidth = $(window).width();
            var scrollTop = $(document).scrollTop();
            //var windowWidth = $(window).width();
            var cardTop = position.top - scrollTop;
            var cardRight = winWidth - position.left;
            if (cardRight < 270) {
                topTrail = position.top - position.height;
                $cardbox.css({
                    top: topTrail+20,
                    left: position.left - 282
                });
                $cardbox[0].className = 'card-pos-r';
            }else if (cardTop < 300) {
                topTrail = position.top + position.height;
                $cardbox.css({
                    top: topTrail+height,
                    left: position.left + 5
                });
                $cardbox[0].className = 'card-pos-b';
            } else {
               
                console.log("鍗＄墖id"+$cardbox.attr("id"));
                if($cardbox.attr("id") == "space_card_content" ){
                    topTrail = position.top - 160;
                }
                else if($cardbox.attr("id") == "FS_card_content"){
                    topTrail = position.top - 190;
                }
              
                $cardbox.css({
                    top: topTrail-20,
                    left: position.left
                });
                $cardbox[0].className = '';
            }
            return topTrail
        }     
    };

})(jQuery);