import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../enum/page_type.dart';

import '../cubit/navigation_cubit.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationTab>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: NavigationTab.values.indexOf(state),
          onTap: (index) {
            context.read<NavigationCubit>().updateTab(
              NavigationTab.values[index],
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera),
              label: 'Durumlar',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Sohbetler'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
