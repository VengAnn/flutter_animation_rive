import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String svgImage;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.svgImage, required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
          // you can use other icon jpg or png
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SvgPicture.asset(svgImage),
          ),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
            ),
          )),
    );
  }
}
