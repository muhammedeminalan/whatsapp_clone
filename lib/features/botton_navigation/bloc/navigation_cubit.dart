import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationTab { conversations, situations, settings }

class NavigationCubit extends Cubit<NavigationTab> {
  // Başlangıç olarak Situations sayfası (index 1)
  NavigationCubit() : super(NavigationTab.situations);

  void updateTab(NavigationTab tab) => emit(tab);
}
