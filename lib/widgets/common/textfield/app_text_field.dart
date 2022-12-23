import 'package:flutter/material.dart';
import 'package:lox_user/constants/font/font_constant.dart';
import 'package:lox_user/constants/ui_constant.dart';
import 'package:lox_user/themes/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscurable = false,
    this.allowBottomSpacing = true,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final bool obscurable;
  final bool allowBottomSpacing;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscured = true;

  renderSuffix() {
    return TextButton(
      onPressed: () => setState(() => obscured = !obscured),
      child: Text(
        obscured ? 'Show' : 'hide',
        style: TextStyle(
          fontSize: FontSize.w16,
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(
        bottom: widget.allowBottomSpacing ? defaultPadding : 0,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: lightGrey1,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obscurable ? obscured : false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                enabledBorder: inputBorder,
                focusedBorder: inputBorder.copyWith(
                  borderSide: BorderSide(
                    color: primaryColor.withOpacity(0.3),
                  ),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: FontSize.w16,
                  color: greyColor,
                ),
              ),
            ),
          ),
          if (widget.obscurable)
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: renderSuffix(),
            )
        ],
      ),
    );
  }
}

final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(
    color: lightGrey2,
  ),
);
