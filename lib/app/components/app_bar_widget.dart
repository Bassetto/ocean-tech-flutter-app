import 'package:flutter/material.dart';
import 'package:ocean_tech/app/core/core.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(130);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Container(
        height: preferredSize.height,
        width: double.maxFinite,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(DefaultValues.padding/2),
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Ocean Tech\nVida na Água",
              style: AppTextStyles.appBar,
            ),
            Container(
              child: Image.asset(
                AppImages.ods14,
                fit: BoxFit.cover,
                width: preferredSize.height * 0.5,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
