// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:whatsapp_clone/core/constants/icons/icons_const.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';

import '../../../../../core/constants/form/form_keys.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = FormKeys.registerFormKey;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLogo(), // Logo en üstte
              24.height, // Boşluk
              _buildFormContainer(),
            ],
          ),
        ),
      ),
    );
  }

  // Logo
  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          IconsConst.appLogo,
          color: context.theme.colorScheme.secondary,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // Form Container
  Widget _buildFormContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FormBuilder(
        key: _formKey,
        child: [
          _buildEmailField(),
          const SizedBox(height: 16),
          _buildPasswordField(),
          const SizedBox(height: 16),
          _buildConfirmPasswordField(),
          const SizedBox(height: 24),
          _buildRegisterButton(),
          const SizedBox(height: 16),
          _buildLoginRedirectButton(),
        ].column(),
      ),
    );
  }

  // E-posta alanı
  Widget _buildEmailField() {
    return FormBuilderTextField(
      name: "email",
      decoration: const InputDecoration(
        labelText: "E-posta",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: "E-posta alanı boş bırakılamaz",
        ),
        FormBuilderValidators.email(errorText: "Geçerli bir e-posta giriniz"),
      ]),
      keyboardType: TextInputType.emailAddress,
    );
  }

  // Şifre alanı
  Widget _buildPasswordField() {
    return FormBuilderTextField(
      name: "password",
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Şifre",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: "Şifre alanı boş bırakılamaz",
        ),
        FormBuilderValidators.minLength(
          6,
          errorText: "Şifre en az 6 karakter olmalıdır",
        ),
      ]),
    );
  }

  // Şifre tekrar alanı
  Widget _buildConfirmPasswordField() {
    return FormBuilderTextField(
      name: "confirm_password",
      obscureText: _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: "Şifre Tekrar",
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: "Şifre tekrar alanı boş bırakılamaz",
        ),
        (val) {
          final password = _formKey.currentState?.fields['password']?.value;
          if (val != password) return "Şifreler eşleşmiyor";
          return null;
        },
      ]),
    );
  }

  // Kayıt Ol Butonu
  Widget _buildRegisterButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.colorScheme.secondary,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        if (_formKey.currentState?.saveAndValidate() ?? false) {
          final values = _formKey.currentState!.value;
          "Register Values: $values".infoLog();
        } else {
          "Form validation hatalı".errorLog();
        }
      },
      child: "Kayıt Ol".text(
        textStyle: context.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  // Giriş Yap Butonu
  Widget _buildLoginRedirectButton() {
    return TextButton(
      onPressed: () {
        context.pop();
      },
      child: "Zaten hesabın var mı? Giriş Yap".text(
        textStyle: context.bodyMedium!.copyWith(
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
