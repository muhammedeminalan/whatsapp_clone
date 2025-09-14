import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/string_extensions.dart';

class RandomUsernameField extends StatefulWidget {
  final String label;
  final int suggestionCount;
  final void Function(String)? onSelected;

  const RandomUsernameField({
    super.key,
    this.label = "",
    this.suggestionCount = 5,
    this.onSelected,
  });

  @override
  State<RandomUsernameField> createState() => _RandomUsernameFieldState();
}

class _RandomUsernameFieldState extends State<RandomUsernameField> {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();

  /// Random suffix üretir, hem harf hem rakam içerir
  String _randomSuffix() {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';
    String letter = letters[_random.nextInt(letters.length)];
    String digit = digits[_random.nextInt(digits.length)];
    return "_$letter$digit";
  }

  /// Kullanıcı yazdıkça öneri listesi üretir
  List<String> _generateSuggestions(String input) {
    if (input.isEmpty) return [];
    String cleanInput = input.toLowerCase().toUsername();
    return List.generate(
      widget.suggestionCount,
      (_) => '$cleanInput${_randomSuffix()}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _generateSuggestions(textEditingValue.text);
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        _controller.text = controller.text;
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.label,
            border: const OutlineInputBorder(),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Material(
          elevation: 4,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return ListTile(
                title: Text(option),
                onTap: () {
                  _controller.text = option;
                  onSelected(option);
                  if (widget.onSelected != null) widget.onSelected!(option);
                },
              );
            },
          ),
        );
      },
      onSelected: (selection) {
        _controller.text = selection;
        if (widget.onSelected != null) widget.onSelected!(selection);
      },
    );
  }
}
