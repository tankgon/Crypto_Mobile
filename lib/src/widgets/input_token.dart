import 'package:flutter/material.dart';

class InputToken extends StatelessWidget {
  const InputToken({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: '',
            hintStyle: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            labelText: ('Xác nhận Token'),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
