import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextNumber extends StatelessWidget {
  const TextNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            hintText: '',
            hintStyle: TextStyle(color: Colors.white),
            labelText: ('Số lượng'),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
            suffix: Text('.000 VND'),
            helperMaxLines: 1,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
