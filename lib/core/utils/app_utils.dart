part of 'utils.dart';

/// logo

int? findChildIndexCallbackKeyInt(Key key) {
  if (key is ObjectKey && key.value != null && key.value is int) {
    return key.value! as int;
  }
  return null;
}

sealed class AppUtils {
  AppUtils._();

  /// box
  static const Gap kGap = Gap(0);
  static const Gap kGap2 = Gap(2);
  static const Gap kGap4 = Gap(4);
  static const Gap kGap6 = Gap(6);
  static const Gap kGap8 = Gap(8);
  static const Gap kGap10 = Gap(10);
  static const Gap kGap12 = Gap(12);
  static const Gap kGap16 = Gap(16);
  static const Gap kGap20 = Gap(20);
  static const Gap kGap24 = Gap(24);
  static const Gap kGap28 = Gap(28);
  static const Gap kGap32 = Gap(32);
  static const Gap kGap36 = Gap(36);
  static const Gap kGap40 = Gap(40);
  static const Gap kGap44 = Gap(44);
  static const Gap kGap64 = Gap(64);

  /// box sliver
  static const kSliverGap8 = SliverGap(8);
  static const kSliverGap10 = SliverGap(10);
  static const kSliverGap12 = SliverGap(12);
  static const kSliverGap16 = SliverGap(16);
  static const kSliverGap24 = SliverGap(24);
  static const kSliverGap32 = SliverGap(32);
  static const kSliverGap40 = SliverGap(40);

  /// divider
  static const Divider kDivider = Divider(height: 1, thickness: 1);
  static const Padding kPad16Divider = Padding(
    padding: EdgeInsets.only(left: 16),
    child: Divider(height: 1, thickness: 1),
  );
  static const Padding kPadHor16Divider = Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(height: 1, thickness: 1),
  );

  /// spacer
  static const Spacer kSpacer = Spacer();

  /// padding
  static const kPadding0 = EdgeInsets.zero;
  static const EdgeInsets kPaddingAll3 = EdgeInsets.all(3);
  static const EdgeInsets kPaddingAll4 = EdgeInsets.all(4);
  static const EdgeInsets kPaddingAll6 = EdgeInsets.all(6);
  static const EdgeInsets kPaddingAll8 = EdgeInsets.all(8);
  static const EdgeInsets kPaddingAll10 = EdgeInsets.all(10);
  static const EdgeInsets kPaddingAll12 = EdgeInsets.all(12);
  static const EdgeInsets kPaddingAll16 = EdgeInsets.all(16);
  static const EdgeInsets kPaddingAll16T0 = EdgeInsets.fromLTRB(16, 0, 16, 16);
  static const EdgeInsets kPaddingAll16T12 = EdgeInsets.fromLTRB(16, 12, 16, 16);
  static const EdgeInsets kPaddingT12 = EdgeInsets.fromLTRB(0, 12, 0, 0);
  static const EdgeInsets kPaddingT12B8 = EdgeInsets.fromLTRB(0, 12, 0, 8);
  static const EdgeInsets kPaddingT16 = EdgeInsets.fromLTRB(0, 16, 0, 0);
  static const EdgeInsets kPaddingR16 = EdgeInsets.fromLTRB(0, 0, 16, 0);
  static const EdgeInsets kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const EdgeInsets kPaddingB12 = EdgeInsets.fromLTRB(0, 0, 0, 12);
  static const EdgeInsets kPaddingB16 = EdgeInsets.fromLTRB(0, 0, 0, 16);
  static const EdgeInsets kPaddingB24 = EdgeInsets.fromLTRB(0, 0, 0, 24);
  static const EdgeInsets kPaddingAll20 = EdgeInsets.all(20);
  static const EdgeInsets kPaddingAll24 = EdgeInsets.all(24);
  static const EdgeInsets kPaddingAll24T0 = EdgeInsets.fromLTRB(24, 0, 24, 24);
  static const EdgeInsets kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets kPaddingHor6 = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets kPaddingHor8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets kPaddingHor10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets kPaddingHor14 = EdgeInsets.symmetric(horizontal: 14);
  static const EdgeInsets kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets kPaddingHor20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets kPaddingHor24 = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets kPaddingHor24V4 = EdgeInsets.symmetric(horizontal: 24, vertical: 4);
  static const EdgeInsets kPaddingVer6 = EdgeInsets.symmetric(vertical: 6);
  static const EdgeInsets kPaddingVer8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets kPaddingVer12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets kPaddingVer16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets kPaddingVer20 = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets kPaddingHor24Ver4 = EdgeInsets.symmetric(horizontal: 24, vertical: 4);
  static const EdgeInsets kPaddingHor24Ver16 = EdgeInsets.symmetric(horizontal: 24, vertical: 16);
  static const EdgeInsets kPaddingHor16Ver24 = EdgeInsets.symmetric(horizontal: 16, vertical: 24);
  static const EdgeInsets kPaddingHor32Ver20 = EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const EdgeInsets kPaddingHor16Ver12 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const EdgeInsets kPaddingHor16Ver10 = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const EdgeInsets kPaddingHor10Ver4 = EdgeInsets.symmetric(horizontal: 10, vertical: 4);
  static const EdgeInsets kPaddingHor16Ver4 = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const EdgeInsets kPaddingHor16Ver8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsets kPaddingLest16Top16 = EdgeInsets.only(left: 16, top: 16);
  static const EdgeInsets kPaddingHor12Ver8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets kPaddingHor8Ver4 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const EdgeInsets kPaddingHor8Ver2 = EdgeInsets.symmetric(horizontal: 8, vertical: 2);
  static const EdgeInsets kPaddingHor10Ver3 = EdgeInsets.symmetric(horizontal: 10, vertical: 3);
  static const EdgeInsets kPaddingLeft12Right6Ver8 = EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8);
  static const EdgeInsets kPaddingLeft24Right24Bottom16 = EdgeInsets.only(left: 24, right: 24, bottom: 16);

  /// border radius
  static const Radius kRadius = Radius.zero;
  static const Radius kRadius8 = Radius.circular(8);
  static const Radius kRadius4 = Radius.circular(4);
  static const Radius kRadius12 = Radius.circular(12);
  static const BorderRadius kBorderRadius = BorderRadius.zero;
  static const BorderRadius kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const BorderRadius kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const BorderRadius kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const BorderRadius kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadius kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const BorderRadius kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const BorderRadius kBorderTopRadius16 = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );
  static const BorderRadius kBorderTopRadius24 = BorderRadius.only(
    topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
  );
  static const BorderRadius kBorderRadius24 = BorderRadius.all(Radius.circular(24));
  static const BorderRadius kBorderRadius48 = BorderRadius.all(Radius.circular(48));
  static const BorderRadius kBorderRadius64 = BorderRadius.all(Radius.circular(64));
  static const kBorderRadius100 = BorderRadius.all(Radius.circular(100));

  static const RoundedRectangleBorder kShapeZero = RoundedRectangleBorder();
  static const RoundedRectangleBorder kShapeTop8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
  );
  static const RoundedRectangleBorder kShapeBottom8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
  );
  static const RoundedRectangleBorder kShapeAll8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  ///
  static const BoxConstraints kBoxConstraints24 = BoxConstraints.tightFor(
    width: 24,
    height: 24,
  );

  static void showSnackBar(
    BuildContext context,
    String text, {
    bool isError = false,
  }) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: isError ? context.color.red : context.color.main,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
