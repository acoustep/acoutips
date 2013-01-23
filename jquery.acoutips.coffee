$ = jQuery

Acoutips = 
	init: (options, @elem)-> # _this = this

		@$elem = $ elem # the element in question
		@on = if (typeof options == 'string') then options else options.on # check options parameter
		@options = $.extend( {},  $.fn.acoutips.options, options ) # set defaults where necessary
		@$elem.on @on, (e)=> # on click/mouseover etc
			@show @$elem # run show function
			if @on == 'click' # if click then stop it redirecting
				e.preventDefault
		@$elem.on @options.off, (e)=> # mouseout etc
			@hide @$elem # run hide function
	show: (e) ->
		if (e.next().attr('class') == @options.classes) # if tooltip exists just show it
			e.next().show()
		else
			@log e.data('tip') # create new tooltip
			$ '<div></div>', 
				text: e.data 'tip' || e.attr 'title' # use data-tip or tooltip
				class: @options.classes # set class
			.insertAfter e # insert after the element
	hide: (e) ->
		if (e.next().attr('class') == @options.classes)
			e.next().hide()
	log: (msg)-> # logger
		console?.log msg if @options.debug # only output if debug is true



$.fn.acoutips = (options) ->
	return @each ()->
		acoutips = Object.create Acoutips
		acoutips.init options, this

$.fn.acoutips.options =
	on: 'mouseover'
	off: 'mouseout'
	classes: 'acoutip_tooltip'
	position: 'bottom left'
	xOffset: 0
	yOffset: 0
	responsive: true
	debug: false