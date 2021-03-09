import 'package:flutter/material.dart';

class VTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? placeholderText;
  VTextField({Key? key, this.onChanged, this.placeholderText})
      : super(key: key);
  void clear() {}
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextField(
        onChanged: onChanged,
        style: TextStyle(
            color: Theme.of(context).primaryColor == Colors.white
                ? Colors.black
                : Colors.white),
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor == Colors.white
              ? Color(0xffdfdfdf)
              : Colors.white,
          filled: true,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
          hintText: placeholderText,
          hintStyle: TextStyle(
              color: Theme.of(context).primaryColor == Colors.white
                  ? Colors.grey
                  : Colors.grey),
        ),
      )
    ]);
  }
}
