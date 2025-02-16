part of 'app_route.dart';

@immutable
sealed class Routes {
  const Routes._();

  static const String initial = '/';
  static const String dashboard = '/dashboard';
  static const String invitetation = '/invitetation';
  static const String sales = '/sales';
  static const String editInvitetation = '/invitetationedit';
}
