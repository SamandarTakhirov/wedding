part of 'app_route.dart';

@immutable
sealed class Routes {
  const Routes._();

  static const String initial = '/';
  static const String dashboard = '/dashboard';
  static const String invitation = '/invitetation';
  static const String sales = '/sales';
  static const String superAdmin = '/superadmin';
  static const String editInvitation = '/invitetation/:templateId/edit';
  static const String viewInvitation = '/:templateId/:userGuid/:shifrcode';
}
