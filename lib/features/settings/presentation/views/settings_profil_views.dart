// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/axis_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/log_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/string_extensions.dart';
import 'package:whatsapp_clone/core/widgets/appBar/core_app_bar.dart';
import 'package:whatsapp_clone/core/widgets/bottom_sheet/fancy_bottom_sheet.dart';
import 'package:whatsapp_clone/core/widgets/text_field/gmail_text_field.dart';
import 'package:whatsapp_clone/core/widgets/text_field/phone_text_field.dart';
import 'package:whatsapp_clone/core/widgets/text_field/random_username_field.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/edit_settings_widgets/about_me_field.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/edit_settings_widgets/edit_profil_card.dart';
import 'package:whatsapp_clone/features/settings/presentation/widgets/edit_settings_widgets/editabled_card.dart';

class SettingsProfilViews extends StatefulWidget {
  const SettingsProfilViews({super.key});

  @override
  State<SettingsProfilViews> createState() => _SettingsProfilViewsState();
}

class _SettingsProfilViewsState extends State<SettingsProfilViews> {
  String userName = "eminaln1".toUsername();

  String aboutMe = "merhaba ben muhammed emin alan flutter developer";

  String phoneNumber = "5352345650".toTurkishPhoneFormat();

  String gmail = "eminalan334".toGmail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            _profilAndEdit(),
            _userName(context),
            _aboutMe(context),
            _phone(context),
            _gmail(context),
            _logOutButton(context),
          ],
        ),
      ),
    );
  }

  EditProfileCard _profilAndEdit() {
    return EditProfileCard(
      imageUrl: "https://i.pravatar.cc/300",
      label: "Düzenle",

      editTap: () {
        return FancyBottomSheet.show(context, content: Column());
      },
    );
  }

  EditableCard _gmail(BuildContext context) {
    return EditableCard(
      title: "E-posta",
      subtitle: gmail,
      onTap: () {
        FancyBottomSheet.show(
          context,
          title: "E-posta",
          content: Column(
            children: [
              GmailTextField(),
              10.height,
              Text(
                "E-posta adresinizle hesabınızı güvenle bağlayın 🔒 ",
                style: context.bodyMedium,
              ),
            ],
          ).crossStart,
        );
      },
    );
  }

  EditableCard _phone(BuildContext context) {
    return EditableCard(
      title: "Telefon Numarası",
      subtitle: phoneNumber,
      onTap: () {
        FancyBottomSheet.show(
          context,
          title: "Telefon",
          content: Column(
            children: [
              TurkeyPhoneField(),
              10.height,
              Text(
                "Telefon numaranızı girin, başında 0 veya +90 ile  ",
                style: context.bodyMedium,
              ),
            ],
          ).crossStart,
        );
      },
    );
  }

  EditableCard _aboutMe(BuildContext context) {
    return EditableCard(
      title: "Hakkımda",
      subtitle: aboutMe,
      onTap: () {
        FancyBottomSheet.show(
          context,
          content: Column(
            children: [
              AboutMeField(
                maxLength: 300,
                minLines: 4,
                maxLines: 8,
                onChanged: (text) {
                  debugPrint("About me: $text");
                },
              ),
              Text(
                "Birkaç cümle ile kendinizi tanıtın 😊",
                style: context.bodyLarge,
              ),
            ],
          ).crossStart,
        );
      },
    );
  }

  EditableCard _userName(BuildContext context) {
    return EditableCard(
      title: "Kullanıcı Adı",
      subtitle: userName,
      onTap: () {
        return FancyBottomSheet.show(
          context,
          title: "Kullanıcı Adı",
          content: Column(
            children: [
              RandomUsernameField(label: 'Kullanıcı Adı'),
              10.height,
              Text(
                "Arkadaşlarınızın sizi bulacağı kullanıcı adınız ne olacak? ",
                style: context.bodyMedium,
              ),
            ],
          ).crossStart,
        );
      },
    );
  }

  TextButton _logOutButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        //TODO Buraya çıkış yap işlemi gelecek
      },
      child: Text(
        "Çıkış Yap",
        style: context.titleLarge!.copyWith(color: context.errorColor),
      ).paddingVertical(24),
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(titleText: "Profil");
  }
}
