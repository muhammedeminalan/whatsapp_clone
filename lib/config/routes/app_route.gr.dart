// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter();

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationView.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const bottom_nav.BottomNavigationView(),
      );
    },
    DmMessageView.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const dm_message.DmMessageView(),
      );
    },
  };
}

/// generated route for
/// [BottomNavigationView]
class BottomNavigationView extends PageRouteInfo<void> {
  const BottomNavigationView({List<PageRouteInfo>? children})
    : super(BottomNavigationView.name, initialChildren: children);

  static const String name = 'BottomNavigationView';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DmMessageView]
class DmMessageView extends PageRouteInfo<void> {
  const DmMessageView({List<PageRouteInfo>? children})
    : super(DmMessageView.name, initialChildren: children);

  static const String name = 'DmMessageView';

  static const PageInfo<void> page = PageInfo<void>(name);
}
