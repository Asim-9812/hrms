



import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

RichText htmlToText(BuildContext context,{required String text, required TextStyle style, int? maxLine}){

  return RichText(
      text: HTML.toTextSpan(context, text, defaultTextStyle: style),
    maxLines: maxLine,
  );

}