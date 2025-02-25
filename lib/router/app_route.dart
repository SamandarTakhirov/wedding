import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/admin/screens/super_admin_dashboard.dart';
import '../features/auth/screen/auth_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/invitetations/data/model/template_info_model.dart';
import '../features/invitetations/screens/edit_invitation_screen.dart';
import '../features/invitetations/screens/invitetation_screen.dart';
import '../features/invitetations/screens/view_invitation_screen.dart';
import '../features/invitetations/templates/invitation_template.dart';
import '../features/main/bloc/main_bloc.dart';
import '../features/main/screens/main_screen.dart';
import '../features/sales/screens/sales_screen.dart';

part 'name_route.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: [
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const AuthScreen(),
    ),
    GoRoute(
      path: Routes.superAdmin,
      name: Routes.superAdmin,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SuperAdminDashboard(),
    ),
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: rootNavigatorKey,
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
          initialLocation: Routes.invitetation,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.invitetation,
              name: Routes.invitetation,
              builder: (_, __) => const InvitetationScreen(),
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
      path: '${Routes.invitetation}/:templateId/edit',
      name: Routes.editInvitetation,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) {
        final templateId = state.pathParameters['templateId'];
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
        final template = state.extra!;
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
