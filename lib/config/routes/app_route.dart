import 'package:auto_route/auto_route.dart';
import 'package:whatsapp_clone/features/botton_navigation/view/bottom_navigation_view.dart'
    as bottom_nav;
import 'package:whatsapp_clone/features/dm_message/presentation/views/dm_mesage_view.dart'
    as dm_message;

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: BottomNavigationView.page, initial: true),
    AutoRoute(page: DmMessageView.page),
  ];
}
