import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../constants/form/form_keys.dart';

/// Tekrar kullanılabilir Gmail kullanıcı adı TextField widget
class GmailTextField extends StatefulWidget {
  final TextEditingController? controller;

  const GmailTextField({super.key, this.controller});

  @override
  createState() => _GmailTextFieldState();
}

class _GmailTextFieldState extends State<GmailTextField> {
  late FocusNode _focusNode;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // TextField odaklandığında validator aktif olsun
        setState(() {
          _validate = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: FormKeys.gmailFormKey,
      autovalidateMode: _validate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled, // sadece tıklanınca validator çalışır
      child: FormBuilderTextField(
        name: 'gmail',
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: const InputDecoration(
          labelText: 'Gmail Kullanıcı Adı',
          border: OutlineInputBorder(),
          suffixText: '@gmail.com',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Kullanıcı adı boş olamaz'),
          FormBuilderValidators.match(
            RegExp(r'^[a-z0-9._]+$'),
            errorText: 'Sadece küçük harf, rakam, nokta ve _ kullanılabilir',
          ),
        ]),
      ),
    );
  }
}
