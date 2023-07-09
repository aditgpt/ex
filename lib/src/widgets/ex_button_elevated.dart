// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_button_default
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="199" alt="image" src="https://user-images.githubusercontent.com/36602270/169626629-60056c7a-2081-4cb5-95a3-b88db7d00492.png">

class ExButtonElevated extends StatelessWidget {
  const ExButtonElevated({
    super.key,
    this.label = '',
    this.labelColor,
    this.labelSize,
    this.isLabelBold = true,
    this.width,
    this.height = 45,
    this.backgroundColor,
    this.radius = 90,
    this.onPressed,
    this.child,
    this.icon,
    this.minimumSize,
  });

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final String? label;
  final double? labelSize;
  final Color? labelColor;
  final bool? isLabelBold;
  final VoidCallback? onPressed;
  final double radius;
  final Widget? icon;
  final Widget? child;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        minimumSize: minimumSize ?? Size(width ?? 44, height ?? 44),
      ),
      child: child ??
          HStack(
            [
              icon?.pOnly(right: 8) ?? 0.heightBox,
              Text(
                '$label',
                style: TextStyle(
                  color: labelColor,
                  fontWeight: isLabelBold == true ? FontWeight.w700 : FontWeight.normal,
                  fontSize: labelSize,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
    );
  }
}
