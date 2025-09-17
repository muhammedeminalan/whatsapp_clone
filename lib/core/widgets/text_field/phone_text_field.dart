import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../constants/form/form_keys.dart';

class TurkeyPhoneField extends StatefulWidget {
  final TextEditingController? controller;

  const TurkeyPhoneField({super.key, this.controller});

  @override
  createState() => _TurkeyPhoneFieldState();
}

class _TurkeyPhoneFieldState extends State<TurkeyPhoneField> {
  late FocusNode _focusNode;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
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
      key: FormKeys.phoneFormKey,
      autovalidateMode: _validate
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: FormBuilderTextField(
        name: 'phone',
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Telefon Numarası',
          border: OutlineInputBorder(),
          prefixText: '+90 ',
        ),
        maxLength: 10, // Türkiye numarası 10 hane
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: 'Telefon numarası boş olamaz',
          ),
          FormBuilderValidators.numeric(errorText: 'Sadece rakam giriniz'),
          FormBuilderValidators.minLength(
            10,
            errorText: '10 haneli numara giriniz',
          ),
          FormBuilderValidators.maxLength(
            10,
            errorText: '10 haneli numara giriniz',
          ),
          (val) {
            if (val != null && val.startsWith('0')) {
              return 'Başında 0 olamaz';
            }
            return null;
          },
        ]),
      ),
    );
  }
}
