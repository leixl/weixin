function(c, a) {
	var d = {
		speed : "400",
		duration : "2000",
		itemsPerSlide : 1,
		autoplay : false,
		wrap : ".ui-slide-wrap",
		content : ".ui-slide-content",
		index : ".ui-slide-index",
		max : ".ui-slide-max",
		btnPrev : ".btn-prev",
		btnNext : ".btn-next",
		controlNav : ".ui-control-nav",
		marginRight : 0,
		lazyload : false,
		direction : "h"
	};
	function b(e) {
		this.config = c.extend({}, d, e);
		this.init()
	}
	b.prototype = {
		init : function() {
			var e = this;
			this.index = 1;
			this.isPlaying = false;
			this.duration = this.config.duration;
			this.wrap = c(this.config.wrap);
			this.items = this.wrap.find(".ui-slide-item");
			this.itemsPerSlide = this.config.itemsPerSlide;
			this.itemCount = this.items.length / this.itemsPerSlide;
			if (this.itemCount === 1) {
				return
			}
			this.wrapWidth = this.wrap.width();
			this.marginRight = this.config.marginRight;
			this.content = this.wrap.find(this.config.content);
			this.setpMax = this.content.data("index-max");
			this.autoplay = this.config.autoplay;
			this.lazyload = this.config.lazyload;
			this.nav = this.wrap.parents().find(this.config.controlNav);
			this.first = this.items.slice(0, this.config.itemsPerSlide).clone();
			this.last = this.items.slice(-this.config.itemsPerSlide).clone();
			if (this.lazyload) {
				this.first.find(".poster img").each(function() {
					var f = c(this);
					f.attr("src", f.data("original"))
				});
				this.last.find(".poster img").each(function() {
					var f = c(this);
					f.attr("src", f.data("original"))
				})
			}
			this.content.append(this.first).prepend(this.last).css({
				left : -(this.wrapWidth + this.marginRight)
			});
			this.btnPrev = this.wrap.parents().find(this.config.btnPrev);
			this.btnNext = this.wrap.parents().find(this.config.btnNext);
			this.listen();
			this.nav.find("a").click(c.proxy(this.turnto, this));
			if (this.autoplay) {
				this.play();
				this.wrap.hover(function() {
					e.pause()
				}, function() {
					e.play()
				});
				c(this.btnPrev).hover(function() {
					e.pause()
				}, function() {
					e.play()
				});
				c(this.btnNext).hover(function() {
					e.pause()
				}, function() {
					e.play()
				})
			}
			if (this.lazyload) {
				this.lazyloadimg()
			}
		},
		lazyloadimg : function() {
			var f = this.index * this.itemsPerSlide, e = (this.index + 1)
					* this.itemsPerSlide + 1;
			this.wrap.find(".poster img").each(function(h, g) {
				if (h >= f && h < e) {
					c(this).attr("src", c(this).data("original"))
				}
			})
		},
		play : function() {
			this.interval = setInterval(c.proxy(this.next, this), this.duration)
		},
		listen : function() {
			this.btnPrev.click(c.proxy(this.prev, this));
			this.btnNext.click(c.proxy(this.next, this))
		},
		pause : function() {
			clearTimeout(this.interval);
			this.interval = null
		},
		prev : function() {
			if (this.isPlaying) {
				return
			}
			this.isPlaying = true;
			var e = this;
			this.index--;
			this.content.animate({
				left : -e.index * (e.wrapWidth + e.marginRight)
			}, e.config.speed, function() {
				if (e.lazyload) {
					e.lazyloadimg()
				}
				if (e.index <= 0) {
					e.index = e.itemCount;
					if (e.lazyload) {
						e.lazyloadimg()
					}
					e.content.css({
						left : -e.index * (e.wrapWidth + e.marginRight)
					})
				}
				e.isPlaying = false
			});
			this.indexTip()
		},
		next : function() {
			if (this.isPlaying) {
				return
			}
			this.isPlaying = true;
			var e = this;
			this.index++;
			this.content.animate({
				left : -e.index * (e.wrapWidth + e.marginRight)
			}, e.config.speed, function() {
				if (e.lazyload) {
					e.lazyloadimg()
				}
				if (e.index >= (e.itemCount + 1)) {
					e.content.css({
						left : -(e.wrapWidth + e.marginRight)
					});
					e.index = 1
				}
				e.isPlaying = false
			});
			this.indexTip()
		},
		indexTip : function() {
			var e;
			switch (this.index) {
			case 0:
				e = this.itemCount;
				break;
			case this.itemCount + 1:
				e = 1;
				break;
			default:
				e = this.index
			}
			this.wrap.parents().find(this.config.index).text(e);
			this.nav.find(".active").removeClass("active").end().find("a").eq(
					e - 1).addClass("active")
		},
		turnto : function(g) {
			if (this.isPlaying) {
				return
			}
			this.pause();
			var f = this;
			f.index = c(g.target).data("index");
			this.content.animate({
				left : -f.index * (f.wrapWidth + f.marginRight)
			}, f.config.speed, function() {
				f.isPlaying = false
			});
			this.indexTip()
		}
	};
	a.Slide = b
}(jQuery, window);