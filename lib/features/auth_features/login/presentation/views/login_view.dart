// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:whatsapp_clone/core/constants/form/form_keys.dart';
import 'package:whatsapp_clone/core/constants/icons/icons_const.dart';
import 'package:whatsapp_clone/core/transitions/app_transitions.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/features/auth_features/register/presentation/views/register_view.dart';
import 'package:whatsapp_clone/features/botton_navigation/view/bottom_navigation_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/auth_features/login/presentation/bloc/login_bloc.dart';
// request model kullanımı kaldırıldı

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = FormKeys.loginFormKey;
  bool _obscurePassword = true; // Şifre göster/gizle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [_buildLogo(), 24.height, _buildLoginForm()],
          ),
        ),
      ),
    );
  }

  /// Logo Alanı

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

  // Login Formu

  Widget _buildLoginForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.1),
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
          const SizedBox(height: 24),
          _buildLoginButton(),
          const SizedBox(height: 16),
          _buildRegisterButton(),
        ].column(),
      ),
    );
  }

  // Email TextField

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

  // Password TextField

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

  // Giriş Yap Butonu

  Widget _buildLoginButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.pushPage(BottomNavigationView());
        } else if (state is LoginFailure) {
          state.message.errorLog();
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.theme.colorScheme.secondary,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading
              ? null
              : () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final values = _formKey.currentState!.value;
                    final email = values['email'] as String;
                    final password = values['password'] as String;
                    context.read<LoginBloc>().add(
                      LoginSubmitted(email: email, password: password),
                    );
                  } else {
                    "Form validation hatalı".errorLog();
                  }
                },
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : "Giriş Yap".text(
                  textStyle: context.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
        );
      },
    );
  }

  //Kayıt Ol TextButton

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: () {
        //  RegisterView sayfasına yönlendirme
        context.pushPage(
          RegisterView(),
          transitionBuilder: AppTransitions.fadeIn(),
        );
      },
      child: "Hesabın yok mu? Kayıt Ol".text(
        textStyle: context.bodyMedium!.copyWith(
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
