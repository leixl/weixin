function showAlert(domObject, parentGroup, content, otherDomHub, place) {
	if (otherDomHub == null) {
		popHub = domObject;
	} else {
		popHub = otherDomHub;
	}
	popHub.popover({
		content : content,
		template : '<div class="popover"><div class="arrow"></div><div class="popover-inner"><div class="popover-content"><p></p></div></div></div>',
		placement : place
	}).popover('show');
	parentGroup.addClass("error");
	popHub.live("focus", function() {
		$(this).popover('destroy');
		parentGroup.removeClass('error');
	});
}

function closeAlert(domObject, parentGroup, otherDomHub) {
	if (otherDomHub == null) {
		popHub = domObject;
	} else {
		popHub = otherDomHub;
	}
	popHub.popover('destroy');
	parentGroup.removeClass('error');
}

function setAlert(domObject, parentGroup, content, otherDomHub, place) {
	var domVal = $.trim(domObject.val());
	if (domVal.length == 0) {
		showAlert(domObject, parentGroup, content, otherDomHub, place);
		return false;
	}
	return true;
}

// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//this String.prototype.trim fix IE's trim bug!
// if(typeof String.prototype.trim !== 'function') {
// String.prototype.trim = function() {
// return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
// }
// }

'use strict';

// Add ECMA262-5 method binding if not supported natively
//
if (!('bind' in Function.prototype)) {
	Function.prototype.bind = function(owner) {
		var that = this;
		if (arguments.length <= 1) {
			return function() {
				return that.apply(owner, arguments);
			};
		} else {
			var args = Array.prototype.slice.call(arguments, 1);
			return function() {
				return that.apply(owner, arguments.length === 0 ? args : args.concat(Array.prototype.slice.call(arguments)));
			};
		}
	};
}

// Add ECMA262-5 string trim if not supported natively
//
if (!('trim' in String.prototype)) {
	String.prototype.trim = function() {
		return this.replace(/^\s+/, '').replace(/\s+$/, '');
	};
}

// Add ECMA262-5 Array methods if not supported natively
//
if (!('indexOf' in Array.prototype)) {
	Array.prototype.indexOf = function(find, i /*opt*/) {
		if (i === undefined)
			i = 0;
		if (i < 0)
			i += this.length;
		if (i < 0)
			i = 0;
		for (var n = this.length; i < n; i++)
			if ( i in this && this[i] === find)
				return i;
		return -1;
	};
}
if (!('lastIndexOf' in Array.prototype)) {
	Array.prototype.lastIndexOf = function(find, i /*opt*/) {
		if (i === undefined)
			i = this.length - 1;
		if (i < 0)
			i += this.length;
		if (i > this.length - 1)
			i = this.length - 1;
		for (i++; i-- > 0; )/* i++ because from-argument is sadly inclusive */
			if ( i in this && this[i] === find)
				return i;
		return -1;
	};
}
if (!('forEach' in Array.prototype)) {
	Array.prototype.forEach = function(action, that /*opt*/) {
		for (var i = 0, n = this.length; i < n; i++)
			if ( i in this)
				action.call(that, this[i], i, this);
	};
}
if (!('map' in Array.prototype)) {
	Array.prototype.map = function(mapper, that /*opt*/) {
		var other = new Array(this.length);
		for (var i = 0, n = this.length; i < n; i++)
			if ( i in this)
				other[i] = mapper.call(that, this[i], i, this);
		return other;
	};
}
if (!('filter' in Array.prototype)) {
	Array.prototype.filter = function(filter, that /*opt*/) {
		var other = [], v;
		for (var i = 0, n = this.length; i < n; i++)
			if ( i in this && filter.call(that, v = this[i], i, this))
				other.push(v);
		return other;
	};
}
if (!('every' in Array.prototype)) {
	Array.prototype.every = function(tester, that /*opt*/) {
		for (var i = 0, n = this.length; i < n; i++)
			if ( i in this && !tester.call(that, this[i], i, this))
				return false;
		return true;
	};
}
if (!('some' in Array.prototype)) {
	Array.prototype.some = function(tester, that /*opt*/) {
		for (var i = 0, n = this.length; i < n; i++)
			if ( i in this && tester.call(that, this[i], i, this))
				return true;
		return false;
	};
}

function check_phone_num(phone_num) {
	var valid = true;
	if (phone_num.length == 11) {
		if (phone_num.charAt(0) == "1") {
			for (var k = 1; k < 11; k++) {
				if (phone_num.charAt(k) < '0' || phone_num.charAt(k) > '9') {
					valid = false;
					break;
				}
			}
		} else {
			valid = false;
		}
	} else {
		valid = false;
	}
	return valid;
}

if (! $.browser.msie ) {
	$("#header").css( "z-index","8000" );
	$("#header").css( "position","relative" );
}