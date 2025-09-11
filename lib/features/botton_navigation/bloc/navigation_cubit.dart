import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/botton_navigation/enum/page_type.dart';

class NavigationCubit extends Cubit<NavigationTab> {
  // Başlangıç olarak Situations sayfası (index 1)
  NavigationCubit() : super(NavigationTab.situations);

  void updateTab(NavigationTab tab) => emit(tab);
}
