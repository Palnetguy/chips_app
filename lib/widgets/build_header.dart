// Build the header section
import 'package:flutter/material.dart';

import '../constants/appconstants.dart';

class AppHeader extends StatelessWidget {
  final TextSpan textSpan;
  final IconData icon;
  const AppHeader({
    super.key,
    required this.textSpan,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: textSpan,
                //  const TextSpan(
                //   children: [
                //     TextSpan(
                //       text: 'Order From The\nBest Of ',
                //       style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.w400,
                //         color: AppConstants.kTextColorPrimary,
                //       ),
                //     ),
                //     TextSpan(
                //       text: 'Snacks',
                //       style: TextStyle(
                //         fontSize: 30,
                //         fontWeight: FontWeight.w700,
                //         color: AppConstants.kTextColorPrimary,
                //       ),
                //     ),
                // ],
                // ),
              ),
            ],
          ),
          Container(
            height: 95,
            padding: const EdgeInsets.all(15),
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              border: Border.all(
                color: AppConstants.kcolorBorderGrey,
                width: 4,
              ),
            ),
            child: Icon(icon),
          ),
        ],
      ),
    );
  }
}
