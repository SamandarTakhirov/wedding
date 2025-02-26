import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_source/local_source.dart';

import '../features/auth/presentation/screen/auth_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/invitations/data/model/template_info_model.dart';
import '../features/invitations/screens/edit_invitation_screen.dart';
import '../features/invitations/screens/invitetation_screen.dart';
import '../features/invitations/screens/view_invitation_screen.dart';
import '../features/invitations/templates/invitation_template.dart';
import '../features/main/bloc/main_bloc.dart';
import '../features/main/screens/main_screen.dart';
import '../features/sales/screens/sales_screen.dart';

part 'name_route.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  redirect: (context, state) async {
    final loggedIn = (await LocalSource.instance).isUserAuthenticated;
    final isAtLogin = state.path == Routes.initial;

    if (!loggedIn && !isAtLogin) {
      return Routes.initial;
    }

    if (loggedIn && isAtLogin) {
      return Routes.dashboard;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const AuthScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, state, navigationShell) => MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            key: state.pageKey,
            create: (_) => MainBloc(),
          ),
        ],
        child: MainScreen(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.dashboard,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.dashboard,
              name: Routes.dashboard,
              builder: (_, __) => const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.invitation,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.invitation,
              name: Routes.invitation,
              builder: (_, __) => const InvitationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.sales,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.sales,
              name: Routes.sales,
              builder: (_, __) => const SalesScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '${Routes.invitation}/:templateId/edit',
      name: Routes.editInvitation,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) {
        // final templateId = state.pathParameters['templateId'];
        final template = state.extra as TemplateInfoModel;
        return EditInvitationScreen(editTemplate: template);
      },
    ),
    GoRoute(
      path: '/view_invitation/:templateId/:userGuid/:shifrcode',
      name: Routes.viewInvitation,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) {
        final templateId = state.pathParameters['templateId'];
        final userGuid = state.pathParameters['userGuid'];
        final shifrcode = state.pathParameters['shifrcode'];
        final template = state.extra;
        if (templateId == null || userGuid == null || shifrcode == null) {
          return const Scaffold(
            body: Center(child: Text('Xatolik: Parametrlar yetishmayapti!')),
          );
        }
        return ViewInvitationScreen(
          template: template as InvitationTemplate,
          templateId: templateId,
          userGuid: userGuid,
          shifrcode: shifrcode,
        );
      },
    ),
  ],
);
