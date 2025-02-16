part of 'package:wedding_day_invite/core/theme/themes.dart';

/// A set of colors for the entire app.
const ColorScheme colorLightScheme = ColorScheme.light(
  primary: Color(0xFF2A7EF6),
  onPrimary: Color(0xFF98A2B3),
  secondary: Color(0xFF92979B),
  onSecondary: Color(0xFFB0B0B0),
  error: Colors.red,
  surface: Color(0xFFF3F4F6),
  secondaryContainer: Color(0xFF343434),
  onSurface: Colors.white,
);

const ColorScheme colorDarkScheme = ColorScheme.dark(
  primary: Color(0xFF2A7EF6),
  onPrimary: Color(0xFF98A2B3),
  surface: Color(0xFF27292C),
  secondary: Color(0xFF98A2B3),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFD93F2F),
  onError: Colors.white,
  secondaryContainer: Color(0xFF343434),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.main,
    required this.cardColor,
    required this.green,
    required this.greenLight,
    required this.white,
    required this.black,
    required this.redIcon,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.grey500,
    required this.gray600,
    required this.grey700,
    required this.gray800,
    required this.grey400,
    required this.grey600,
    required this.darker,
    required this.greydark,
    required this.red,
    required this.textLight,
    required this.transparent,
    required this.yellow,
    required this.whiteOpacity05,
    required this.whiteOpacity5,
    required this.midnightBlue800,
    required this.slate900,
    required this.gray900,
    required this.warning500,
    required this.cB54708,
    required this.cFFFAEB,
    required this.c175CD3,
    required this.cEFF8FF,
    required this.c027A48,
    required this.cECFDF3,
    required this.cB42318,
    required this.cFEF3F2,
    required this.c16A34A,
    required this.c039855,
  });

  final Color main;
  final Color cardColor;
  final Color green;
  final Color greenLight;
  final Color white;
  final Color black;
  final Color redIcon;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color grey400;
  final Color grey500;
  final Color grey600;
  final Color grey700;
  final Color midnightBlue800;
  final Color whiteOpacity05;
  final Color whiteOpacity5;
  final Color gray600;
  final Color gray800;
  final Color gray900;
  final Color darker;
  final Color yellow;
  final Color red;
  final Color greydark;
  final Color textLight;
  final Color transparent;
  final Color slate900;
  final Color warning500;
  final Color cB54708;
  final Color cFFFAEB;
  final Color c175CD3;
  final Color cEFF8FF;
  final Color c027A48;
  final Color cECFDF3;
  final Color cB42318;
  final Color cFEF3F2;
  final Color c16A34A;
  final Color c039855;

  static const ThemeColors light = ThemeColors(
    darker: Color(0xFF17212B),
    grey400: Color(0xFF98A2B3),
    grey600: Color(0xFF475467),
    greydark: Color(0xFF17212B),
    red: Color(0xFFD85757),
    textLight: Color(0xFF3F3F3F),
    transparent: Color(0x00000000),
    yellow: Color.fromARGB(255, 255, 255, 0),
    main: Color(0xFF2A7EF6),
    green: Color(0xFF32B141),
    white: Colors.white,
    black: Colors.black,
    redIcon: Color(0xFFF2271C),
    gray100: Color(0xFFF5F5F5),
    gray200: Color(0xFFEAECF0),
    gray300: Color(0xFFD0D5DD),
    grey500: Color(0xFF667085),
    gray600: Color(0xFF475467),
    grey700: Color(0xFF344054),
    gray800: Color(0xFF1D2939),
    gray900: Color(0xFF101828),
    slate900: Color(0xFF0F172A),
    midnightBlue800: Color(0xFF004F8E),
    cardColor: Colors.white,
    whiteOpacity05: Color.fromRGBO(255, 255, 255, 0.05),
    whiteOpacity5: Color.fromRGBO(255, 255, 255, 0.5),
    warning500: Color(0xFFF79009),
    cB54708: Color(0xFFB54708),
    cFFFAEB: Color(0xFFFFFAEB),
    c175CD3: Color(0xFF175CD3),
    cEFF8FF: Color(0xFFEFF8FF),
    c027A48: Color(0xFF027A48),
    cECFDF3: Color(0xFFECFDF3),
    cB42318: Color(0xFFB42318),
    cFEF3F2: Color(0xFFFEF3F2),
    c16A34A: Color(0xFF16A34A),
    greenLight: Color(0xFFD1FADF),
    c039855: Color(0xFF039855),
  );

  static const ThemeColors dark = ThemeColors(
    darker: Color(0xFF17212B),
    grey400: Color(0xFF98A2B3),
    grey600: Color(0xFF475467),
    greydark: Color(0xFF17212B),
    red: Color(0xFFD85757),
    textLight: Color(0xFF3F3F3F),
    transparent: Color(0x00000000),
    yellow: Color.fromARGB(255, 255, 255, 0),
    main: Color(0xFF2A7EF6),
    green: Color(0xFF32B141),
    white: Colors.white,
    black: Colors.black,
    redIcon: Color(0xFFF2271C),
    cardColor: Color(0xFF1E1E1E),
    gray100: Color(0xFFF5F5F5),
    gray200: Color(0xFFEAECF0),
    gray300: Color(0xFFD0D5DD),
    grey500: Color(0xFF667085),
    gray600: Color(0xFF475467),
    grey700: Color(0xFF344054),
    gray800: Color(0xFF1D2939),
    gray900: Color(0xFF1D2939),
    slate900: Color(0xFF0F172A),
    midnightBlue800: Color(0xFF004F8E),
    whiteOpacity05: Color.fromRGBO(255, 255, 255, 0.05),
    whiteOpacity5: Color.fromRGBO(255, 255, 255, 0.5),
    warning500: Color(0xFFF79009),
    cB54708: Color(0xFFB54708),
    cFFFAEB: Color(0xFFFFFAEB),
    c175CD3: Color(0xFF175CD3),
    cEFF8FF: Color(0xFFEFF8FF),
    c027A48: Color(0xFF027A48),
    cECFDF3: Color(0xFFECFDF3),
    cB42318: Color(0xFFB42318),
    cFEF3F2: Color(0xFFFEF3F2),
    c16A34A: Color(0xFF16A34A),
    greenLight: Color(0xFFD1FADF),
    c039855: Color(0xFF039855),
  );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      darker: Color.lerp(darker, other.darker, t)!,
      grey400: Color.lerp(grey400, other.grey400, t)!,
      grey600: Color.lerp(grey600, other.grey600, t)!,
      greydark: Color.lerp(greydark, other.greydark, t)!,
      red: Color.lerp(red, other.red, t)!,
      textLight: Color.lerp(textLight, other.textLight, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      whiteOpacity5: Color.lerp(whiteOpacity5, other.whiteOpacity5, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      green: Color.lerp(green, other.green, t)!,
      greenLight: Color.lerp(greenLight, other.greenLight, t)!,
      main: Color.lerp(main, other.main, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      redIcon: Color.lerp(redIcon, other.redIcon, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      slate900: Color.lerp(slate900, other.slate900, t)!,
      gray900: Color.lerp(gray900, other.gray900, t)!,
      whiteOpacity05: Color.lerp(whiteOpacity05, other.whiteOpacity05, t)!,
      midnightBlue800: Color.lerp(midnightBlue800, other.midnightBlue800, t)!,
      warning500: Color.lerp(warning500, other.warning500, t)!,
      cB54708: Color.lerp(cB54708, other.cB54708, t)!,
      cFFFAEB: Color.lerp(cFFFAEB, other.cFFFAEB, t)!,
      c175CD3: Color.lerp(c175CD3, other.c175CD3, t)!,
      cEFF8FF: Color.lerp(cEFF8FF, other.cEFF8FF, t)!,
      c027A48: Color.lerp(c027A48, other.c027A48, t)!,
      cECFDF3: Color.lerp(cECFDF3, other.cECFDF3, t)!,
      cB42318: Color.lerp(cB42318, other.cB42318, t)!,
      cFEF3F2: Color.lerp(cFEF3F2, other.cFEF3F2, t)!,
      c16A34A: Color.lerp(c16A34A, other.c16A34A, t)!,
      c039855: Color.lerp(c039855, other.c039855, t)!,
    );
  }

  @override
  ThemeColors copyWith({
    Color? main,
    Color? cardColor,
    Color? green,
    Color? greenLight,
    Color? white,
    Color? black,
    Color? redIcon,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? grey400,
    Color? grey500,
    Color? grey600,
    Color? grey700,
    Color? whiteOpacity05,
    Color? whiteOpacity5,
    Color? gray600,
    Color? gray800,
    Color? gray900,
    Color? darker,
    Color? yellow,
    Color? red,
    Color? greydark,
    Color? textLight,
    Color? transparent,
    Color? midnightBlue800,
    Color? slate900,
    Color? warning500,
    Color? cB54708,
    Color? cFFFAEB,
    Color? c175CD3,
    Color? cEFF8FF,
    Color? c027A48,
    Color? cECFDF3,
    Color? cB42318,
    Color? cFEF3F2,
    Color? c16A34A,
    Color? c039855,
  }) =>
      ThemeColors(
        main: main ?? this.main,
        cardColor: cardColor ?? this.cardColor,
        green: green ?? this.green,
        greenLight: greenLight ?? this.greenLight,
        white: white ?? this.white,
        black: black ?? this.black,
        redIcon: redIcon ?? this.redIcon,
        gray100: gray100 ?? this.gray100,
        gray200: gray200 ?? this.gray200,
        gray300: gray300 ?? this.gray300,
        grey400: grey400 ?? this.grey400,
        grey500: grey500 ?? this.grey500,
        grey600: grey600 ?? this.grey600,
        grey700: grey700 ?? this.grey700,
        whiteOpacity05: whiteOpacity05 ?? this.whiteOpacity05,
        whiteOpacity5: whiteOpacity5 ?? this.whiteOpacity5,
        gray600: gray600 ?? this.gray600,
        gray800: gray800 ?? this.gray800,
        darker: darker ?? this.darker,
        yellow: yellow ?? this.yellow,
        red: red ?? this.red,
        greydark: greydark ?? this.greydark,
        textLight: textLight ?? this.textLight,
        transparent: transparent ?? this.transparent,
        midnightBlue800: midnightBlue800 ?? this.midnightBlue800,
        slate900: slate900 ?? this.slate900,
        gray900: gray900 ?? this.gray900,
        warning500: warning500 ?? this.warning500,
        cB54708: cB54708 ?? this.cB54708,
        cFFFAEB: cFFFAEB ?? this.cFFFAEB,
        c175CD3: c175CD3 ?? this.c175CD3,
        cEFF8FF: cEFF8FF ?? this.cEFF8FF,
        c027A48: c027A48 ?? this.c027A48,
        cECFDF3: cECFDF3 ?? this.cECFDF3,
        cB42318: cB42318 ?? this.cB42318,
        cFEF3F2: cFEF3F2 ?? this.cFEF3F2,
        c16A34A: c16A34A ?? this.c16A34A,
        c039855: c039855 ?? this.c039855,
      );
}
