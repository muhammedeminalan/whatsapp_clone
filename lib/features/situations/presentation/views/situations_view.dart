// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/core/widgets/appBar/core_app_bar.dart';
import 'package:whatsapp_clone/features/situations/presentation/widgets/status_add_card.dart';
import 'package:whatsapp_clone/core/widgets/card/status_card.dart';

class SituationsView extends StatefulWidget {
  const SituationsView({super.key});

  @override
  State<SituationsView> createState() => _SituationsViewState();
}

class _SituationsViewState extends State<SituationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  Column _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _statusAddCard().paddingAll(10),
        Text(
          "Yakındaki Durumlar",
          style: context.bodySmall!.copyWith(fontSize: 20),
        ).paddingAll(18),
        _statusCard(),
      ],
    );
  }

  Expanded _statusCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return StatusCard(
            userName: "Kullanıcı $index",
            url: "https://i.pravatar.cc/150?img=$index",
          );
        },
      ),
    );
  }

  StatusAddCard _statusAddCard() {
    return StatusAddCard(
      profileImageUrl: "https://i.pravatar.cc/150?img=1",
      userName: 'Wonzy',
      onAddPressed: () => debugPrint('Add button clicked'),
      onIcon1Pressed: () => debugPrint('Call clicked'),
      onIcon2Pressed: () => debugPrint('Message clicked'),
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(
      titleText: "Durumlar",
      leading: _more_icon_button(onTap: () {}),
    );
  }

  IconButton _more_icon_button({void Function()? onTap}) {
    return IconButton(
      icon: CostumIconButton(icon: Icons.more_horiz, onTap: onTap),
      onPressed: () {},
    );
  }
}
