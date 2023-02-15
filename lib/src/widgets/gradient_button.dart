import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.name,
  }) : super(key: key);
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.only(top: 50),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff8AD4EC),
            Color(0xffEF96FF),
            Color(0xffFF56A9),
            Color(0xffFFAA6C),
          ],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Text(
          name!,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }
}
