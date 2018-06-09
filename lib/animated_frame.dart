library animated_frame;

import 'dart:async';
import 'dart:ui' as UI;

import 'package:flutter/widgets.dart';
import 'dart:async' as Async;
import 'dart:io';


///
/// This widget is used to generate animated frame.
///
/// For example:
/// if you have a sequence of images ,and you want to make a animation use these images,
///              this widget is suit for you.
/// If you have a image contains sequence of frames, this widget is suit for you.
///
///
class AnimatedFrame extends StatefulWidget{


  /// child you want to display
  final Widget child;

  /// width of this widget
  final double width;

  /// height of this widget
  final double height;


  /// sequence of images
  final int count;

  /// frame per second
  final int fps;

  AnimatedFrame({this.child,this.width,this.height,this.count,this.fps:30});

  @override
  State<StatefulWidget> createState() {
    return new _AnimatedFrameState();
  }

}


class _AnimatedFrameState extends State<AnimatedFrame>{

  int _index = 0;

  Async.Timer timer;

  @override
  void initState() {
    timer = new Async.Timer.periodic(new Duration(milliseconds: 1000.0 ~/ widget.fps ), _onTimer );
    super.initState();
  }

  void _onTimer(Async.Timer timer){
    setState(() {
      ++_index;
      if(_index >= widget.count){
        _index = 0;
      }
    });
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width;
    double height = widget.height;
    return new SizedBox(
      width: width,
      height: height,
      child: new Stack(
        children: <Widget>[
          new Positioned(
            child: widget.child,top: 0.0,left:-_index*width,height: height, width: widget.count * width ,)
        ],

      ),

    );
  }

}