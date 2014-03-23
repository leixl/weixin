
Do(function(){
  var popup;var nav=$("#db-global-nav");var more=nav.find(".bn-more");nav.delegate(".bn-more, .top-nav-reminder .lnk-remind","click",function(c){c.preventDefault();var a=$(this);var b=a.parent();if(popup){popup.parent().removeClass("more-active");if($.contains(b[0],popup[0])){popup=null;return}}b.addClass("more-active");popup=b.find(".more-items");popup.trigger("moreitem:show");return});$(document).click(function(a){if($(a.target).closest(".more-items").length||$(a.target).closest(".more-active").length){return}if(popup){popup.parent().removeClass("more-active");popup=null}});
});

    Do(function() {
      $.getScripts=function(){var b=Array.prototype.slice.call(arguments);if(!b.length){return}(function a(c){if(!c){return}if(typeof c=="function"){c();return}$.ajax({url:c,dataType:"script",cache:true,complete:function(){a(b.shift())}})})(b.shift())};
      $.getScripts(
        'http://img3.douban.com/f/shire/551ce7ff54f931bfb81b8af01942c8785f7eedf7/js/lib/jquery.tmpl.min.js',
        'http://img3.douban.com/f/movie/a197eee0a397e035a64abc25febc9b88c554f5c4/js/movie/search_sugg.js',
        function() {
         $("#db-nav-movie").find("input[name=search_text]").iSuggest({
             api: '/j/subject_suggest',
             tmplId: 'suggResult',
             item_act: function(item){
                 window.location = item.data("link");
             }
         });
      });
    });
  
Do(function(){
  var nav = $('#db-nav-movie');
  var inp=$("#inp-query"),label=inp.closest(".nav-search").find("label");if("placeholder" in inp[0]){label.hide();inp.attr("placeholder",label.text())}else{if(inp.val()!==""){label.hide()}inp.parent().click(function(){inp.focus();label.hide()}).end().focusin(function(){label.hide()}).focusout(function(){if($.trim(this.value)===""){label.show()}else{label.hide()}}).keydown(function(){label.hide()})}inp.parents("form").submit(function(){if(!$.trim(inp.val()).length){return false}});nav.find(".lnk-more, .lnk-account").click(function(b){b.preventDefault();var d,a=$(this),c=a.hasClass("lnk-more")?$("#db-productions"):$("#db-usr-setting");if(!c.data("init")){d=a.offset();c.css({"margin-left":(d.left-$(window).width()/2-c.width()+a.width()+parseInt(a.css("padding-right"),10))+"px",left:"50%",top:d.top+a.height()+"px"});c.data("init",1);c.hide();$("body").click(function(g){var f=$(g.target);if(f.hasClass("lnk-more")||f.hasClass("lnk-account")||f.closest("#db-usr-setting").length||f.closest("#db-productions").length){return}c.hide()})}if(c.css("display")==="none"){$(".dropdown").hide();c.show()}else{$(".dropdown").hide()}});
});

        Do.ready(
            'http://img3.douban.com/f/movie/de24c86dcb7dadf5bc1bb7d6925a1e7cfbb54007/js/movie/slide.js',
            'http://img3.douban.com/f/movie/cedfd3c8ab9671b413b5327344818cf42ed64129/js/movie/subject_detail_tip.js',
            function(){
                var screeningSlide = new Slide({
                        autoplay: true,
                        wrap: $('#screening .screening-bd'),
                        speed: 600,
                        duration: 20000,
                        marginRight: 24,
                        itemsPerSlide: 4,
                        lazyload: false
                    });

                $('.ui-slide-item img').subjectTip('.ui-slide-item', 'screening');
        });
    
        Do.ready(
            'http://img3.douban.com/f/movie/cedfd3c8ab9671b413b5327344818cf42ed64129/js/movie/subject_detail_tip.js',
            function(){
                $('#new-movies .list-item img').subjectTip('#new-movies .list-item')

                $('#new-movies')
                    .delegate('.category-hd', 'click', function(e){
                        e.preventDefault()
                        var $this = $(e.target)

                        $('.category-hd').removeClass('on')
                        $this.addClass('on')

                        $('.category-bd').hide()
                        $($this.attr('href'))
                            .show()
                    })
            });
    
        Do.ready(
            'http://img3.douban.com/f/movie/9696e785827346c2ae0b4085065408feee7722ec/js/movie/cinemas_suggestion.js',
            'http://img3.douban.com/f/movie/8af56711f3387cb18aa972ce4784e91889a6d1d6/js/movie/hot_cities.js',
            'http://img3.douban.com/f/shire/d96d615ee6e42807bb081b3e3e0089753ffdb731/js/core/moreurl.js',
            function(){
                $.fn.searchCinema($('#cinemas-suggestion-input input'), {
                    itemCallback: function(self){
                        moreurl(self, {from: 'mv_cg'});
                        window.location.href = $(self).find('a').attr('href');
                    }
                });

                function changeCity(e){
                    $('#city-id')
                        .data('city-id', $(e.target).attr('id'))
                        .text($(e.target).text());
                }

                var hot = new HotCities({'trigger': '#city-id', 'changeCity': changeCity});

                hot.init();
        });
    
        Do.ready(
            'http://img3.douban.com/f/shire/d1d34e0b0ae2cfefd1f5476d048208a4fa51d5ee/js/jquery.lazyload.min.js',
            function(){
                $('.lazy').lazyload({threshold: 350, effect: 'fadeIn'});

                $('#city-id').bind('click', function(e){
                    $('#cinemas-suggestion-input input').blur();
                    return false;
                });

                $(document)
                    .delegate('.poster img', 'mouseenter', function(e){
                        $('#cities-list').hide();
                        $('#cinemas-suggestion-input input').blur();
                    });

                $('#cinemas-suggestion-input input').val('').blur();
            }
        );
    