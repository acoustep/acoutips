# Acoutips

## Introduction
Acoutips is a barebones tool tip generator to get started use the following code:

## Instructions
```html
<a href="#" id="default_tooltip" data-tip="This is a test">Default behaviour</a>

<script>
	$('#default_tooltip').acoutips('mouseover');
</script>
```

Anything inside of the data-top attribute gets made into a tool tip. And mouseover can also be changed to 'click' depending on how you want to activate the tool tip.

The following options are also available for customisation:
* on: 'mouseover' - alternatives: click
* off: 'mouseout' (currently there is no other option)
* class: 'acoutips' - note that you can add as many classes as you seperated by spaces but keep the acoutips class as well if you wish to keep the default styling.
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
* transitional effects.
* Option to make tool tip stick until an event is triggered.
* Prettier default styling.
* Needs to be browser tested.