import 'package:flutter/material.dart';
import 'package:snggle/config/app_colors.dart';
import 'package:snggle/config/app_icons/app_icons.dart';
import 'package:snggle/views/widgets/icons/asset_icon.dart';
import 'package:sprung/sprung.dart';

class BottomTooltipItem extends StatelessWidget {
  final AssetIconData assetIconData;
  final String label;
  final VoidCallback? onTap;

  const BottomTooltipItem({
    required this.assetIconData,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: onTap == null ? 0.3 : 1,
      duration: const Duration(milliseconds: 800),
      curve: Sprung.custom(mass: 1, stiffness: 100, damping: 15),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: AssetIcon(
                assetIconData,
                key: Key(assetIconData.assetName),
                size: 16,
                color: AppColors.body3,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Text(
                label,
                key: Key(label),
                style: TextStyle(fontSize: 12, color: AppColors.body3, letterSpacing: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
