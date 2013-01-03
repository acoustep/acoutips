if( typeof Object.create !== 'function' ) {
	Object.create = function( obj ) {
		function F(){}
		F.prototype = obj;
		return new F();
	};
}

(function( $, window, document, undefined ) {
	var Acoutips = {
		init: function( options, elem ) {
			var self = this;
			self.elem = elem;
			self.$elem = $( elem );
			self.on = ( typeof options === 'string') ? options : options.on;
			self.options = $.extend( {},  $.fn.acoutips.options, options );
			self.$elem.on(self.on, function( e ) {
				$this = $(this);
				self.show($this, self.options); //show the tooltip
				self.position($this, self.options); //adjust the position of the tooltip
				if(self.options.responsive === true){
					self.responsive($this); //if true move tip to fit into browser document
				}
				if( self.on === 'click' ){
					e.preventDefault(); //if user wants tool tip to show up on click then stop the link from working
				}
			});
			self.$elem.on('mouseout', function() {
				self.hide($(this));
			});
		},
		show: function($this, options){
				var tipId = 'acoutips-' + $this.attr('id');

				if($this.siblings('#' + tipId).length > 0){
					$('#' + tipId).show();
				} else {
					$('<div></div>', {
						text: $this.data('tip'),
						id: tipId,
						class: options.class
					}).insertAfter($this);
				}
		},
		hide: function($this){
			var tipId = 'acoutips-' + $this.attr('id');
			$('#' + tipId).hide();
		},
		position: function($this, options){
				var position = $this.position(),
						height = $this.height(),
						width = 0,
						tipId = 'acoutips-' + $this.attr('id');

				if(options.xPosition === 'right'){
					width = $this.outerWidth();
				} else if(options.xPosition === 'left'){
					width = -$('#' + tipId).outerWidth();

				} else if(options.xPosition === 'right-align'){
					width = $this.outerWidth() - $( '#' +tipId ).outerWidth();
				}
				if(options.yPosition === 'top'){
					$('#' + tipId)
						.css({ 
									left: position.left + width + options.xOffset,
									top: position.top - $( '#' +tipId ).outerHeight() - options.yOffset
								});
				} else {
					$('#' + tipId)
						.css({ 
									left: position.left + width + options.xOffset,
									top: position.top + height + options.yOffset
								});
				}
		},
		responsive: function($this){
			//console.log($(self.body).width());
			var tipId = 'acoutips-' + $this.attr('id'),
					position = $('#' + tipId).position().left + $('#' + tipId).outerWidth(),
					positionLeft = $('#' + tipId).position().left,
					windowOuterWidth = window.outerWidth;
			//console.log(windowOuterWidth);
			//console.log(position);
			if( position > windowOuterWidth ){
				//console.log('true');
				 // newPosition = position - windowOuterWidth;
				 var newPosition = position - positionLeft;
				//console.log(newPosition);
				$('#' + tipId).css({
					left: '-=' + newPosition
				});
			} else if ( position < 0 ){
				$('#' + tipId).css({
					left: 0
				});
			}
		}
	};
	
	$.fn.acoutips = function( options ) {
		return this.each(function(){
			var acoutips = Object.create( Acoutips );
			acoutips.init( options, this );
		});
	};

	$.fn.acoutips.options = {
		on: 'mouseover',
		off: 'mouseout',
		class: 'acoutips',
		xPosition: 'default',
		yPosition: 'bottom',
		xOffset: 0,
		yOffset: 0,
		responsive: true
		// search: '@tutspremium',
		// wrapEachWith: '<li></li>',
		// limit: 10,
		// refresh: null,
		// onComplete: null,
		// transition: 'fadeToggle'
	};

})( jQuery, window, document );
