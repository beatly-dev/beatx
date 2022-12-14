/// AUTO GENERATED BY BEATX
/// DO NOT MODIFY THIS BY YOURSELF

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import r'index.dart';

GoRoute get $settingsScreenRoute => GoRouteData.$route(
      path: '/settings',
      factory: SettingsScreenRoute.fromState,
    );

class SettingsScreenRoute extends GoRouteData {
  const SettingsScreenRoute(this.title, {required this.$extra});

  factory SettingsScreenRoute.fromState(GoRouterState state) {
    final title = state.queryParams['title']!;
    final $extra = state.extra as int;

    return SettingsScreenRoute(title, $extra: $extra);
  }

  final String title;
  final int $extra;

  @override
  Widget build(BuildContext context) => SettingsScreen(title, $extra: $extra);

  String get location => GoRouteData.$location(
        '/settings',
        queryParams: {if (title != null) 'title': title},
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);

  void replace(BuildContext context) => context.replace(location, extra: this);
}
