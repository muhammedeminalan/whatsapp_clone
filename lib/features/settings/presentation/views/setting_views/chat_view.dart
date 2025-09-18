import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/core/widgets/index.dart';
import 'package:whatsapp_clone/features/dm_message/presentation/views/dm_mesage_view.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody.column());
  }

  List<Widget> get _buildBody {
    return [_listViewBuilder().expanded()];
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return _listTitle(
          context,
          index,
        ).paddingOnly(top: 10, left: 10, right: 10);
      },
    );
  }

  Card _listTitle(BuildContext context, int index) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {
          context.pushPage(DmMessageView());
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150?img=${index + 1}",
          ),
        ),
        title: "Fake user ${index + 1}".text(textStyle: context.titleMedium),
      ),
    );
  }

  CoreAppBar _buildAppBar() {
    return CoreAppBar(titleText: "Tüm sohbetler");
  }
}
