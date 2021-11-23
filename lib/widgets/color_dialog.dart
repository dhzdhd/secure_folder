import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:provider/provider.dart';
import 'package:secure_folder/models/theme.dart';

class ColorDialogWidget extends StatefulWidget {
  @override
  _ColorDialogWidgetState createState() => _ColorDialogWidgetState();
}

class _ColorDialogWidgetState extends State<ColorDialogWidget> {
  var dialogPickerColor = Colors.black;

  Future<bool> colorPickerDialog(Color bgColor, Color textColor) async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 10,
      runSpacing: 10,
      wheelDiameter: 150,
      heading: Text(
        'Select color',
        style: TextStyle(color: textColor, fontSize: 20),
      ),
      subheading: Text('Select shade', style: TextStyle(color: textColor)),
      wheelSubheading: Text('Select shade', style: TextStyle(color: textColor)),
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      colorCodeTextStyle: TextStyle(color: textColor),
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      barrierColor: Colors.transparent,
      backgroundColor: bgColor,
      contentPadding: EdgeInsets.only(top: 10),
      buttonPadding: EdgeInsets.only(right: 50),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return ContentDialog(
        backgroundDismiss: true,
        title: Text('Choose color'),
        content: Container(
          child: ColorIndicator(
            color: dialogPickerColor,
            onSelectFocus: false,
            onSelect: () async {
              final Color colorBeforeDialog = dialogPickerColor;
              if (!(await colorPickerDialog(
                model.primaryColor.withOpacity(0.9),
                model.textColor,
              ))) {
                setState(() {
                  dialogPickerColor = colorBeforeDialog;
                });
              }
            },
          ),
        ),
        actions: [
          SizedBox(
            width: 300,
            child: Center(
              child: Button(
                child: Text('Apply'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Center(
              child: Button(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
