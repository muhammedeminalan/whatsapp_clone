// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/core/widgets/core_app_bar.dart';

class SituationsView extends StatefulWidget {
  const SituationsView({super.key});

  @override
  State<SituationsView> createState() => _SituationsViewState();
}

class _SituationsViewState extends State<SituationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=$index",
                    ),
                  ),
                  title: Text('Kullanıcı $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(
      titleText: "Durum Görünümü",
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
