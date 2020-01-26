import 'package:flutter/material.dart';

extension ListenerViewTool on Widget{
  Listener putIntoListner(Listener listener){
    return Listener(
        key:key,
  onPointerDown:listener.onPointerDown, 
  onPointerMove:listener.onPointerMove, 
  onPointerUp:listener.onPointerUp, 
  onPointerCancel:listener.onPointerCancel, 
  behavior:listener.behavior, 
  child:this,
    );
  }

}

extension GestureViewTool on Widget{
  GestureDetector putIntoGeustureDetector(GestureDetector gestureDetector){
    return GestureDetector(
      key:gestureDetector.key,
      child: this,
      onTapDown: gestureDetector.onTapDown,
      onTapUp: gestureDetector.onTapUp,
      onTap: gestureDetector.onTap,
      onTapCancel: gestureDetector.onTapCancel,
      onSecondaryTapDown: gestureDetector.onSecondaryTapDown,
      onSecondaryTapUp: gestureDetector.onSecondaryTapUp,
      onSecondaryTapCancel: gestureDetector.onSecondaryTapCancel,
      onDoubleTap: gestureDetector.onDoubleTap,
      onLongPress: gestureDetector.onLongPress,
      onLongPressStart: gestureDetector.onLongPressStart,
      onLongPressMoveUpdate: gestureDetector.onLongPressMoveUpdate,
      onLongPressUp: gestureDetector.onLongPressUp,
      onLongPressEnd: gestureDetector.onLongPressEnd,
      onVerticalDragDown: gestureDetector.onVerticalDragDown,
      onVerticalDragStart: gestureDetector.onVerticalDragStart,
      onVerticalDragUpdate: gestureDetector.onVerticalDragUpdate,
      onVerticalDragEnd: gestureDetector.onVerticalDragEnd,
      onVerticalDragCancel: gestureDetector.onVerticalDragCancel,
      onHorizontalDragDown: gestureDetector.onHorizontalDragDown,
      onHorizontalDragStart: gestureDetector.onHorizontalDragStart,
      onHorizontalDragUpdate: gestureDetector.onHorizontalDragUpdate,
      onHorizontalDragEnd: gestureDetector.onHorizontalDragEnd,
      onHorizontalDragCancel: gestureDetector.onHorizontalDragCancel,
      onForcePressStart: gestureDetector.onForcePressStart,
      onForcePressPeak: gestureDetector.onForcePressPeak,
      onForcePressUpdate: gestureDetector.onForcePressUpdate,
      onForcePressEnd: gestureDetector.onForcePressEnd,
      onPanDown: gestureDetector.onPanDown,
      onPanStart: gestureDetector.onPanStart,
      onPanUpdate: gestureDetector.onPanUpdate,
      onPanEnd: gestureDetector.onPanEnd,
      onPanCancel: gestureDetector.onPanCancel,
      onScaleStart: gestureDetector.onScaleStart,
      onScaleUpdate: gestureDetector.onScaleUpdate,
      onScaleEnd: gestureDetector.onScaleEnd,
      behavior: gestureDetector.behavior,
      excludeFromSemantics: gestureDetector.excludeFromSemantics,
      dragStartBehavior: gestureDetector.dragStartBehavior,
    );
  }
}

extension GestureViewToolGetWidget on GestureDetector{
  Widget getWidght(){
    // if(this.noSuchMethod(invocation))
    // this.
    // this.noSuchMethod(Invocation)
    return this.child;
  }
}