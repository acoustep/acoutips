# Acoutips

## Introduction

Acoutips is a barebones jQuery tool tip generator.

View the demo [here](http://mitchstanley.co.uk/acoutips/index.html)

## Instructions
Make sure you include jQuery (tested with 1.8+ although I suspect it will work with older versions) and the acoutips.jquery.js file.

To get started use the following code:

```html
<style>
	.acoutips
	{
		border-radius:5px;
		background:#999;
		color:#fff;
		font-size: 11px;
		position:absolute;
		padding:10px;
	}
	.set_width
	{
		width:200px;
	}
</style>

<a href="#" id="default_tooltip" data-tip="This is a test">Default behaviour</a>

<script>
	$('#default_tooltip').acoutips('mouseover');
</script>
```

Anything inside of the data-tip attribute gets made into a tool tip.

The following options are also available for customisation:
* on: 'mouseover' - alternatives: click
* off: 'mouseout' (currently there is no other option)
* class: 'acoutips' - note that you can add as many classes as you wish separated by spaces. Include the acoutips class as well if you wish to keep the default styling.
* xPosition: 'default' - default is 'left-align', alternatively you can use 'right', 'right-align' or 'left'
* yPosition: 'bottom' - use 'top' to show the tool tip above
* xOffset: 0 - add or subtract along the x-axis
* yOffset: 0 - add or subtract along the y-axis
* responsive: true - if true (by default) the tooltip will try to stay with in the borders of the browser - this may affect desired positioning but stops text from being cut off.

```html
<a href="#" id="right_responsive_set_width_tooltip" data-tip="This is a test" style="float:right">Right responsive set width behaviour</a>

<script>
$('#right_responsive_set_width_tooltip').acoutips({
			on: 'mouseover',
			xPosition: 'right',
			class: 'acoutips set_width'
});
</script>
```
## To do
* Allow function call with no parameters.
* transitional effects.
* Option to make tool tip stick until an event is triggered.
* Allow title attribute to be used for tool tip text - but let data-tip take priority if both exist.
* Tidy up the code.
* yPosition 'middle' to align in the middle.
* Prettier default styling.
* Needs to be browser tested.

## Known Issues
None.
