import 'package:flutter/material.dart';

class AnimatedSliverListView extends StatefulWidget {
  const AnimatedSliverListView({
    Key? key,
    required this.children,
    required this.transitionType,
    required this.delay,
  }) : super(key: key);

  final List<Widget> children;
  final Duration delay;
  final TransitionType transitionType;

  @override
  State<AnimatedSliverListView> createState() => _AnimatedSliverListViewState();
}

class _AnimatedSliverListViewState extends State<AnimatedSliverListView> {
  final _listKey = GlobalKey<SliverAnimatedListState>();
  final List<Widget> _list = [];

  bool _animationExecuted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_animationExecuted) {
        _runAnimation();
        _animationExecuted = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _listKey,
      initialItemCount: _list.length,
      itemBuilder: (context, index, animation) => _buildAnimatedItem(index, animation),
    );
  }

  Widget _buildAnimatedItem(int index, Animation<double> animation) {
    switch (widget.transitionType) {
      case TransitionType.fade:
        return FadeTransition(
          opacity: animation,
          child: _list[index],
        );
      case TransitionType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.3, 0.0), // start from right
            end: Offset.zero, // end at the original position
          ).animate(animation),
          child: _list[index],
        );
      case TransitionType.scale:
        return ScaleTransition(
          scale: animation,
          child: _list[index],
        );
      case TransitionType.rotation:
        return RotationTransition(
          turns: animation,
          child: _list[index],
        );
    }
  }

  void _runAnimation() async {
    for (int i = 0; i < widget.children.length; i++) {
      _list.add(widget.children[i]);
      _listKey.currentState!.insertItem(i, duration: const Duration(milliseconds: 350));
      await Future.delayed(widget.delay);
    }
  }
}

enum TransitionType {
  fade,
  slide,
  scale,
  rotation,
}
