import 'package:flutter/material.dart';
import 'package:movie_flutter/src/config/themes/app_colors.dart';

class ItemSetting extends StatelessWidget {
  const ItemSetting({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;

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
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  width: 250,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, overflow: TextOverflow.ellipsis),
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
