import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../../../../utils/enums.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../shared/widgets/power_btn.dart';
import '../../domain/models/devices.dart';
import '../widgets/gradient_progress_indicator.dart';

class LightScreen extends StatefulWidget {
  final Device device;
  LightScreen({Key? key, required this.device})
      : assert(device.type == DeviceType.light),
        super(key: key);

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    var theme = context.read<ThemeProvider>();
    return Scaffold(
      backgroundColor: BatThemeData.of(context).colors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32.h + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  if (AppNavigator.canPop)
                    GestureDetector(
                      onTap: () => AppNavigator.pop(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Light',
                        style:
                            BatThemeData.of(context).typography.headline4Medium,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Living Room',
                        style: BatThemeData.of(context).typography.headline4,
                      ),
                      Switch.adaptive(
                        value: _isOn,
                        onChanged: (bool v) {
                          setState(() {
                            _isOn = v;
                          });
                        },
                        activeColor: BatPalette.primary,
                      )
                    ],
                  ),
                  Text(
                    'Light Intesity',
                    style: BatThemeData.of(context)
                        .typography
                        .bodyCopy
                        .copyWith(
                            color: theme.isDark
                                ? BatPalette.white60
                                : BatPalette.grey60),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              if (_isOn)
                Image.asset(
                  'assets/images/light_on.png',
                  width: 159.w,
                )
              else
                Image.asset(
                  'assets/images/light_off.png',
                  width: 75.w,
                ),
              SizedBox(height: 40.h),
              GradientCircularProgressIndicator(
                radius: 100.r,
                gradientColors: [
                  const Color(0XFFE89D0D),
                  const Color(0XFFFCFBC3),
                  BatPalette.primary,
                  BatPalette.secondary,
                ],
                strokeWidth: 28.0.w,
              ),
              SizedBox(height: 80.h),
              ChipButton(
                child: Icon(
                  Icons.power_settings_new_rounded,
                  color: BatPalette.white,
                ),
                onPressed: () {
                  setState(() {
                    _isOn = !_isOn;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
