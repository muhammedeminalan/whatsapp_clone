import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/utils/extensions/num_extensions.dart';
import 'package:whatsapp_clone/core/widgets/button/costum_icon_button.dart';
import 'package:whatsapp_clone/core/widgets/core_app_bar.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({super.key});

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: Column(
        children: [
          12.height,
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              hintText: "Sohbet Ara",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          12.height,
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=${index + 1}',
                    ), // Placeholder image
                  ),
                  title: Text('Kullanıcı ${index + 1}'),
                  subtitle: Text('Son mesaj burada görünecek...'),
                  trailing: Text('12:34 PM'),
                  onTap: () {
                    // Sohbet ekranına gitmek için gerekli işlemler
                  },
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
      titleText: "Sohbetler",
      leading: IconButton(
        icon: CostumIconButton(icon: Icons.more_horiz, onTap: () {}),
        onPressed: () {},
      ),
      actions: [
        CostumIconButton(icon: Icons.camera_alt, onTap: () {}),
        12.width,
        CostumIconButton(
          icon: Icons.add,
          onTap: () {},
          iconColor: Colors.black,
          bgColor: Colors.green,
        ),
        8.width,
      ],
    );
  }
}
