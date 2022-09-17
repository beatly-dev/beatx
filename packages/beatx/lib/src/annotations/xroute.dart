import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Annotate the main widget of a route
///
/// [isRoot] is set `false` by default. This flag indicates that
/// this route is a new page rather than a component of a parent route's widget.
/// If [isRoot] is set to `true`, then [go_router]'s default transition
/// is used. If you want to modify the transition behaviour, then
/// you can annotate your `GoRouteData` with [XTransition].
class XRoute {
  const XRoute({
    this.isRoot = false,
    this.buildPage,
  });

  /// If the widget is not the sub page, but a new root
  /// you can set this to [true]
  final bool isRoot;

  /// Custom page builder.
  /// Users can instantiate their own [CustomTransitionPage] here.
  /// beatx provides a default widget through [child].
  /// You can use [child] directly or you can create your own
  /// child widget.
  final Page<T> Function<T>(
    BuildContext context,
    Widget child,
    GoRouterState state,
  )? buildPage;
}

const xroute = XRoute();
