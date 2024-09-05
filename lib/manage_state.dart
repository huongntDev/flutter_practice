import 'package:flutter/material.dart';

// Tapbox A manages its own state
class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _actiive = false;

  void _handleTap() {
    setState(() {
      _actiive = !_actiive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: _actiive ? Colors.lightGreen[700] : Colors.grey[600],
          ),
          child: Center(
            child: Text(
              _actiive ? "Action" : "Inactive",
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ));
  }
}

// The parent widget manages the state of the child widget
class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxB({Key? key, required this.active, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onChanged(!active),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
          child: Center(
            child: Text(
              active ? "Action" : "Inactive",
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ));
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTap(bool newValue) {
    setState(() {
      _active = !newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(active: _active, onChanged: _handleTap),
    );
  }

}