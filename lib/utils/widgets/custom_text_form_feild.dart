import 'package:flutter/material.dart';
import 'package:sprints_profile_management_project/utils/widgets/custom_outline_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.maxLine,
      this.validator,
      this.controller,
      this.isReadOnly = false,
      this.enableFocusBorder = true,
      this.textInputType,
      this.suffixText,
      this.suffixTextStyle,
      this.labelWidget,
      this.borderColor,
      this.borderRadius,
      this.borderWidth,
      this.prefixWidget,
      this.suffixWidget,
      this.textStyle,
      this.enableFill = true,
      this.fillColor,
      this.label,
      this.isObeseureText = false,
      this.labelStyle,
      this.focusBorderColor,
      this.floatingLabelBehavior,
      this.focusNode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.initalText,
      this.enabled = true});
  final Widget? labelWidget;
  final double? borderRadius;
  final String? Function(String? value)? validator;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool enableFill;
  final Widget? suffixWidget;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Widget? prefixWidget;
  final int? maxLine;
  final TextInputType? textInputType;
  final bool enableFocusBorder;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? label;
  final TextStyle? labelStyle;
  final bool isObeseureText;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final void Function(String?)? onFieldSubmitted;
  final bool enabled;
  final bool isReadOnly;
  final String? initalText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: isObeseureText,
      validator: validator,
      focusNode: focusNode,
      textInputAction: textInputAction,
      controller: controller,
      maxLines: maxLine,
      keyboardType: textInputType,
      cursorColor: Colors.black,
      style: textStyle,
      initialValue: initalText,
      readOnly: isReadOnly,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        focusColor: Colors.black,
        suffixIcon: suffixWidget,
        suffixText: suffixText,
        suffixStyle: suffixTextStyle,
        fillColor: fillColor,
        filled: enableFill,
        prefixIcon: prefixWidget,
        label: labelWidget,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.never,
        disabledBorder: customOutLineBorders(),
        border: customOutLineBorders(),
        enabledBorder: customOutLineBorders(),
        hoverColor: Colors.white,
      ),
    );
  }
}
