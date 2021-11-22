import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

final globalAccentColor = Color.fromARGB(255, 76, 194, 255);

final lightSecondaryColor = Color.fromARGB(20, 0, 0, 0);
final lightAccentTextColor = Colors.white;
final lightTheme = ThemeData(
  brightness: Brightness.light,
  micaBackgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.transparent,
  activeColor: Colors.transparent,
  inactiveColor: Colors.transparent,
  inactiveBackgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  disabledColor: Colors.transparent,
  accentColor: globalAccentColor.toAccentColor(),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.black)),
    selectedTextStyle: ButtonState.all(TextStyle(color: Colors.black)),
    labelPadding: EdgeInsets.only(left: 10),
    iconPadding: EdgeInsets.only(left: 10),
    animationDuration: Duration(milliseconds: 150),
    tileColor: ButtonState.all(Colors.transparent),
  ),
);

final darkSecondaryColor = Color.fromARGB(20, 255, 255, 255);
final darkAccentTextColor = Colors.black;
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  micaBackgroundColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.transparent,
  activeColor: Colors.transparent,
  inactiveColor: Colors.transparent,
  inactiveBackgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  disabledColor: Colors.transparent,
  accentColor: globalAccentColor.toAccentColor(),
  navigationPaneTheme: NavigationPaneThemeData(
    unselectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    selectedTextStyle: ButtonState.all(TextStyle(color: Colors.white)),
    labelPadding: EdgeInsets.only(left: 10),
    iconPadding: EdgeInsets.only(left: 10),
    animationDuration: Duration(milliseconds: 150),
    tileColor: ButtonState.all(Colors.transparent),
  ),
);

class ThemeModel extends ChangeNotifier {
  var theme = darkTheme;
  var accentColor = globalAccentColor;
  var secondaryColor = darkSecondaryColor;
  var accentTextColor = darkAccentTextColor;

  Future<void> setWindowEffect(String mode) async {
    await Window.setEffect(
      effect: WindowEffect.mica,
      dark: mode == 'dark' ? true : false,
    );
  }

  Future<void> changeTheme(String mode) async {
    switch (mode) {
      case 'light':
        {
          theme = lightTheme;
          accentColor = accentColor;
          secondaryColor = lightSecondaryColor;
          accentTextColor = lightAccentTextColor;
          await setWindowEffect(mode);
          break;
        }
      case 'dark':
        {
          theme = darkTheme;
          accentColor = accentColor;
          secondaryColor = darkSecondaryColor;
          accentTextColor = darkAccentTextColor;
          await setWindowEffect(mode);
          break;
        }
    }
    notifyListeners();
  }
}
