import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smarty/main.dart';

import '../../../../shared/res/res.dart';

class VoiceTile extends StatelessWidget {
  final String name;
  final Function(bool)? onChanged;
  final bool value;
  const VoiceTile({
    Key? key,
    required this.name,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeProvider>();
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.isDark ? BatPalette.white10 : SmartyColors.grey10,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: BatThemeData.of(context).typography.headline4.copyWith(
                color: theme.isDark ? BatPalette.white80 : BatPalette.grey80),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: SmartyColors.primary,
          )
        ],
      ),
    );
  }
}
