// core/constants/form_keys.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormKeys {
  FormKeys._();

  static final GlobalKey<FormBuilderState> gmailFormKey =
      GlobalKey<FormBuilderState>();
  static final GlobalKey<FormBuilderState> phoneFormKey =
      GlobalKey<FormBuilderState>();
  static final GlobalKey<FormBuilderState> loginFormKey =
      GlobalKey<FormBuilderState>();
  static final GlobalKey<FormBuilderState> registerFormKey =
      GlobalKey<FormBuilderState>();
}
