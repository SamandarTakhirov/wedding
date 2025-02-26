part of 'package:wedding_day_invite/core/either/either.dart';

extension FutureEither<L, R> on Future<Either<L, R>> {
  Future<bool> get isLeft => then((either) => either.isLeft);

  Future<bool> get isRight => then((either) => either.isRight);

  /// Transform values of [Left] and [Right]
  Future<Either<TL, TR>> either<TL, TR>(
    TL Function(L left) fnL,
    TR Function(R right) fnR,
  ) =>
      then((either) => either.either(fnL, fnR));

  /// Fold [Left] and [Right] into the value of one type
  Future<T> fold<T>(
    FutureOr<T> Function(L left) fnL,
    FutureOr<T> Function(R right) fnR,
  ) =>
      then((either) => either.fold(fnL, fnR));

  /// Swap [Left] and [Right]
  Future<Either<R, L>> swap() => this.fold<Either<R, L>>(Right.new, Left.new);
}
