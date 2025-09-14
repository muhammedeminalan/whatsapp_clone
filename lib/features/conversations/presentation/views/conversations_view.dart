// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/transitions/app_transitions.dart';
import 'package:whatsapp_clone/features/camera/presentation/cubit/camera_cubit.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/core/widgets/appBar/core_app_bar.dart';
import 'package:whatsapp_clone/core/widgets/card/dismisible_card.dart';
import 'package:whatsapp_clone/core/widgets/text_field/costum_text_field.dart';
import 'package:whatsapp_clone/features/camera/presentation/view/camera_view.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/views/dm_mesage_view.dart';
import 'package:whatsapp_clone/core/utils/extensions/navigator_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/paddings_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/utils/extensions/content_extensions.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({super.key});

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showTextField = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_showTextField.value) _showTextField.value = true;
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_showTextField.value) _showTextField.value = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _showTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CameraCubit(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _search(),
            Expanded(
              child: BlocBuilder<CameraCubit, String?>(
                builder: (context, photoPath) {
                  return Column(
                    children: [
                      // Fotoğraf varsa göster
                      if (photoPath != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(File(photoPath), height: 200),
                        ),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return DismisibleCard(
                              profil:
                                  'https://i.pravatar.cc/150?img=${index + 1}',
                              userName: 'Fake User ${index + 1}',
                              message: 'Merhaba, nasılsın? ${index + 1}',
                              time: '2:07',
                              unreadCount: 0,
                              controller: DismisibleCardController(
                                onPinned: () {},
                              ),
                              onMoreTap: () =>
                                  debugPrint('More button clicked'),
                              onTap: () {
                                context.pushPage(
                                  DmMessageView(),
                                  transitionBuilder: AppTransitions.slide(),
                                );
                              },
                            ).paddingOnly(bottom: 3);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ValueListenableBuilder<bool> _search() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showTextField,
      builder: (context, show, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: show ? 60 : 0,
          child: show
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CostumTextField(prefixIcon: Icon(Icons.search)),
                )
              : null,
        );
      },
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(
      titleText: "Sohbetler",
      leading: _more_icon_button(onTap: () {}),
      actions: [
        _camera_icon_button(onTap: () => context.pushPage(CameraPage())),
        12.width,
        _add_icon_button(onTap: () {}),
        8.width,
      ],
    );
  }

  IconButton _more_icon_button({void Function()? onTap}) {
    return IconButton(
      icon: CostumIconButton(icon: Icons.more_horiz, onTap: onTap),
      onPressed: () {},
    );
  }

  CostumIconButton _add_icon_button({void Function()? onTap}) {
    return CostumIconButton(
      icon: Icons.add,
      onTap: onTap,
      iconColor: context.primaryColor,
      bgColor: context.secondaryColor,
    );
  }

  CostumIconButton _camera_icon_button({void Function()? onTap}) =>
      CostumIconButton(icon: Icons.camera_alt, onTap: onTap);
}
