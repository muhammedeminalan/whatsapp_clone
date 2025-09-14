import 'package:flutter/material.dart';

class AboutMeField extends StatefulWidget {
  final String hint;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final void Function(String)? onChanged;

  const AboutMeField({
    super.key,
    this.hint = "Kendinizi tanıtın...",
    this.maxLength = 250,
    this.minLines = 3,
    this.maxLines = 6,
    this.onChanged,
  });

  @override
  State<AboutMeField> createState() => _AboutMeFieldState();
}

class _AboutMeFieldState extends State<AboutMeField> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<int> _lengthNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _lengthNotifier.value = _controller.text.length;
      widget.onChanged?.call(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _controller,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            counterText: "",
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _lengthNotifier,
          builder: (context, length, child) {
            return Padding(
              padding: const EdgeInsets.only(top: 4, right: 8),
              child: Text(
                '$length/${widget.maxLength}',
                style: TextStyle(
                  color: length > widget.maxLength ? Colors.red : Colors.grey,
                  fontSize: 12,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
