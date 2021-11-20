import 'package:flutter/material.dart';
import 'package:ocean_tech/app/core/core.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

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
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              ),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => scaffoldKey.currentState!.openDrawer(),
            ),
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
