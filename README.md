# animated_frame

This widget is used to generate animated frame.

# Showcase

![](https://github.com/jzoom/images/raw/master/animated_frame.gif)

# Usage

For example:

If you have a sequence of images ,and you want to make a animation use these images,
              this widget is suit for you.
If you have a image contains sequence of frames, this widget is suit for you.


# Example

loading.png contains sequence of images,you' find here

![](https://github.com/jzoom/animated_frame/raw/master/example/assets/loading.png)

```
new AnimatedFrame(
  child: new Image.asset("assets/loading.png",fit: BoxFit.fill,),
  count: 44,
  width: 50.0,
  height: 50.0,
)


```
