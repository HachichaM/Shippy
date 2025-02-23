import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredFloatingButton extends StatefulWidget {
  final List<FloatingButtonOption> options;

  const BlurredFloatingButton({Key? key, required this.options}) : super(key: key);

  @override
  _BlurredFloatingButtonState createState() => _BlurredFloatingButtonState();
}

class _BlurredFloatingButtonState extends State<BlurredFloatingButton>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleMenu() {
    setState(() {
      isExpanded = !isExpanded;
      isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (isExpanded)
          Positioned.fill(
            child: GestureDetector(
              onTap: toggleMenu,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.options.map((option) {
                  return _buildOption(option.icon, option.label, option.bgColor, option.onPressed);
                }).toList(),
              ),
            ),
            FloatingActionButton(
              onPressed: toggleMenu,
              backgroundColor: Colors.blue,
              child: Icon(isExpanded ? Icons.close : Icons.add, size: 30),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOption(IconData icon, String label, Color bgColor, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Lexend', fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

// Model for the floating button options
class FloatingButtonOption {
  final IconData icon;
  final String label;
  final Color bgColor;
  final VoidCallback onPressed;

  FloatingButtonOption({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.onPressed,
  });
}
