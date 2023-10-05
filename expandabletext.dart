import 'package:flutter/material.dart';
class ExpandableText extends StatefulWidget {
  final String text;
  final double fontSize =12;
  final Color textColor=Colors.black;

  ExpandableText({
    required this.text,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isExpanded ? widget.text : _truncateText(widget.text),
          style: TextStyle(fontSize: widget.fontSize, color: widget.textColor),
        ),
        if (!_isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Read More',
                style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        if (_isExpanded)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Read Less',
                style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }

  String _truncateText(String text) {
    final List<String> lines = text.split('\n');
    if (lines.length > 5) {
      return lines.sublist(0, 5).join('\n');
    }
    return text;
  }
}
