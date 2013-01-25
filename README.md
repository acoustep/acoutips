# Acoutips 2.0

## What is Acoutips?
Acoutips is a simple jQuery tooltip generator.  This version of acoutips is currently unreliable and missing key features. If you are looking for something to use in production please go to the master branch!

## Usage
Acoutips requires jQuery.  It has been tested with 1.8 but 1.7+ should work fine.

To begin, you can call it on a class or identifier as shown below

```
$('.tooltip').acoutips();
```
This is equivalent to 

```
$('.tooltip').acoutips({
	on: 'mouseover',
	position: 'bottom left-inline',
	off: 'mouseout'
});
```

Or alternatively

```
$('.tooltip').acoutips('bottom left-inline');
```
There are many ways to position.  Note that the position is always two words in a string.  The first word is the y position and the second is the x position.

### Y Postions:
* above / top
* middle
* bottom-inline
* top-inline
* bottom / below (default)

### X Positions
* right
* right-inline
* center / centre
* left
* left-inline (default)

### Recommendations

**Popular combinations**

* 'bottom left'
* 'bottom left-inline'
* 'bottom center'
* 'bottom right-inline'
* 'bottom right'
* 'top left'
* 'top left-inline'
* 'top center'
* 'top right-inline'
* 'top right'

**Please think before using these combinations:**

* Any combination with the use of middle for the y axis.
* Any combination with the use of top-inline for the y axis.
* Any combination with the use of bottom-inline for the y axis.

These may work with certain lengths of texts, in certain positions or setting an offset.

Some of these may also work fine normally but if you have responsive set to true (which is default) then it may end up overlapping the linked text on page edges. 

As always use your judgement and test carefully.

## Changes
2.0 is mostly a code review, however; I decided to try writing it in coffeescript this time.  If you do wish to contribute then please edit the .coffee file.

Many of the features are still in development so please feel free to check out the master branch if you are in need of something for production usage.

## To do (from previous version)
* responsive tooltips
* offsets

## Implemented Improvements
* Calling the plugin with class names as well as identifiers
* Better/more positioning options
* Plugin call with no parameters

## Intended Improvements
* Tidying up code
* Transitional effects
* Prettier default styling
* An option to click off to hide tooltip

