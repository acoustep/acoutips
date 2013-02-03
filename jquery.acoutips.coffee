$ = jQuery

Acoutips = 
	init: (options=null, @elem)-> # _this = this
		@$elem = $ elem # the element in question
		
		if options? # checks if any options are entered
			@on = if options.on? then options.on else $.fn.acoutips.options.on
			@options = $.extend( {},  $.fn.acoutips.options, options ) # extend the defaults
			@options.position = if (typeof options == 'string') # if options is a string then set it as the position
				options 
			else if options.position? # else if options.position exists use that
				options.position
			else 
				$.fn.acoutips.options.position # if in doubt default out
		else # no options so set defaults
			@on = $.fn.acoutips.options.on
			@options = $.fn.acoutips.options
		@$elem.on @on, (e)=> # on click/mouseover etc
			@show @$elem # run show function
			if @on == 'click' # if click then stop it redirecting
				e.preventDefault
		@$elem.on @options.off, (e)=> # mouseout etc
			@hide @$elem # run hide function
	show: (e) ->
		if (e.next().attr('class') == @options.classes) # if tooltip exists just show it
			if @options.transition? then e.next().stop()[@options.transition](@options.transitionOptions)
		else
			@log e.data('tip') # create new tooltip
			$ '<div></div>', 
				text: e.data 'tip' || e.attr 'title' # use data-tip or tooltip
				class: @options.classes # set class
				style: 'display:none'
			.insertAfter e  # insert after the element
			if @options.transition? then e.next().stop()[@options.transition](@options.transitionOptions)
		@position()
	position: () ->
		$tooltip = @$elem.next()
		link_position = @$elem.position()
		link_width = @$elem.outerWidth() # width of the original element
		link_height = @$elem.outerHeight() # height of the original element
		tooltip_width = $tooltip.outerWidth() # width of the tooltip
		tooltip_height = $tooltip.outerHeight() # height of the tooltip
		@log link_width 
		@log tooltip_width 
		[y_position, x_position] = @options.position.split(" ") # split up the positioning
		@log "#{y_position} #{x_position}"
		switch x_position
			when 'right'
				leftPosition = link_position.left + link_width
			when 'right-inline'
				leftPosition = (link_position.left + link_width) - tooltip_width
			when 'center', 'centre' # Yes, I'm from England
				leftPosition = link_position.left + ((link_width / 2) - (tooltip_width / 2))
			when 'left'
				leftPosition = link_position.left - tooltip_width
			else # left-inline by default
				leftPosition = link_position.left

		switch y_position
			when 'above', 'top'
				topPosition = link_position.top - tooltip_height
			when 'middle' # put
				topPosition = link_position.top + ((link_height / 2) - (tooltip_height / 2))
			when 'bottom-inline'
				topPosition = (link_position.top + link_height) - tooltip_height
			when 'top-inline'
				topPosition = link_position.top
			else # put undernearth (bottom)
				topPosition = link_position.top + link_height

		if @options.responsive # if responsive is true
			windowWidth = window.outerWidth
			@log 'window width: ' + windowWidth
			rightPosition = leftPosition + tooltip_width
			@log 'right position: ' + rightPosition
			if leftPosition < 0 then leftPosition = 0
			else if rightPosition > windowWidth
				excess = rightPosition - windowWidth
				leftPosition = leftPosition - excess
				@log 'excess: ' + excess + ' new right position: ' + (leftPosition + tooltip_width)

		$tooltip.css 
			left: leftPosition
			top: topPosition

	hide: (e) ->
		if (e.next().attr('class') == @options.classes)
			if @options.transition? then e.next().stop()[@options.transition](@options.transitionOptions)
	log: (msg)-> # logger
		console?.log msg if @options.debug # only output if debug is true



$.fn.acoutips = (options=null) ->
	return @each ()->
		acoutips = Object.create Acoutips
		acoutips.init options, this

$.fn.acoutips.options =
	on: 'mouseover'
	off: 'mouseout'
	classes: 'acoutip_tooltip'
	position: 'bottom left-inline'
	xOffset: 0
	yOffset: 0
	responsive: true
	transition: 'toggle'
	transitionOptions: null
	debug: false