import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone/core/transitions/app_transitions.dart';
import 'package:whatsapp_clone/features/camera/presentation/view/camera_view.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/views/dm_mesage_view.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/core/widgets/index.dart';

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
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _search(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return DismisibleCard(
                        profil: 'https://i.pravatar.cc/150?img=${index + 1}',
                        userName: 'Fake User ${index + 1}',
                        message: 'Merhaba, nasılsın? ${index + 1}',
                        time: '2:07',
                        unreadCount: 0,
                        controller: DismisibleCardController(onPinned: () {}),
                        onMoreTap: () => debugPrint('More button clicked'),
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
            ),
          ),
        ],
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
                  child: CostumTextField(prefixIcon: const Icon(Icons.search)),
                )
              : null,
        );
      },
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(
      titleText: "Sohbetler",
      leading: _moreIcon(onTap: () {}),
      actions: [
        _cameraIcon(onTap: () => context.pushPage(const CameraPage())),
        12.width,
        _addIcon(onTap: () {}),
        8.width,
      ],
    );
  }

  IconButton _moreIcon({void Function()? onTap}) {
    return IconButton(
      icon: CostumIconButton(icon: Icons.more_horiz, onTap: onTap),
      onPressed: () {},
    );
  }

  CostumIconButton _addIcon({void Function()? onTap}) {
    return CostumIconButton(
      icon: Icons.add,
      onTap: onTap,
      iconColor: context.primaryColor,
      bgColor: context.secondaryColor,
    );
  }

  CostumIconButton _cameraIcon({void Function()? onTap}) =>
      CostumIconButton(icon: Icons.camera_alt, onTap: onTap);
}
