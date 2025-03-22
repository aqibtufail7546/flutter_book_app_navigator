import 'package:flutter/material.dart';

class SlideButton extends StatefulWidget {
  final VoidCallback onSlideCompleted;

  const SlideButton({
    Key? key,
    required this.onSlideCompleted,
  }) : super(key: key);

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  double _position = 0;
  final double _buttonWidth = 60;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 48;
    final maxPosition = width - _buttonWidth;

    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'Slide to continue',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            left: _position,
            top: 0,
            child: GestureDetector(
              onHorizontalDragStart: (_) {
                setState(() {
                  _isDragging = true;
                });
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _position += details.delta.dx;
                  _position = _position.clamp(0, maxPosition);
                });
              },
              onHorizontalDragEnd: (_) {
                setState(() {
                  _isDragging = false;
                  if (_position > maxPosition * 0.8) {
                    _position = maxPosition;
                    widget.onSlideCompleted();
                  } else {
                    _position = 0;
                  }
                });
              },
              child: Container(
                width: _buttonWidth,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
