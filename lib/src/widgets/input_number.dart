import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({
    Key? key,
    this.lable,
  }) : super(key: key);
  final String? lable;
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: '',
            hintStyle: const TextStyle(color: Colors.white),
            labelText: lable,
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            suffix: const Text('.000 VND'),
            helperMaxLines: 1,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
