import 'package:flutter/material.dart';
import 'package:movie_flutter/src/styles/themes/app_colors.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting(
      {Key? key, required this.name, required this.icon, required this.size})
      : super(key: key);
  final String name;
  final IconData icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColors.white,
                size: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  width: size.width / 1.8,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 17, overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: AppColors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
