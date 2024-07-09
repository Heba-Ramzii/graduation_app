import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:graduation_app/core/theme_manager/style_manager.dart';
import '../../../../core/theme_manager/colors_manager.dart';
class FileContainer extends StatelessWidget {
     const FileContainer({super.key,});
   final bool isClear = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius:StyleManager.borderRadius,
      ),
      child:  const Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon( IconlyLight.document,
                    color: ColorsManager.primaryLight4,
                  ),
                  SizedBox(width: 8,),
                  Text("CV",
                    style: StyleManager.textStyle14,
                  ),
                  Spacer(),
                  isClear ? Icon(
                    Icons.done_rounded,
                    color: ColorsManager.primaryLight4,
                  ) : Icon(
                    IconlyBold.infoCircle,
                    color: ColorsManager.red,
                  ),
                ],
              ),
              if(!isClear)
                Padding(
                  padding: EdgeInsets.only(top: 5.0,left: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "The file is not clear",
                      style: StyleManager.warringTextStyle15,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon( IconlyLight.document,
                      color: ColorsManager.primaryLight4,
                    ),
                    SizedBox(width: 8,),
                    Text("Graduation Certificate",
                      style: StyleManager.textStyle14,
                    ),
                    Spacer(),
                    isClear ? Icon(
                      Icons.done_rounded,
                      color: ColorsManager.primaryLight4,
                    ) : Icon(
                      IconlyBold.infoCircle,
                      color: ColorsManager.red,
                    ),

                  ],
                ),
                if(!isClear)
                  Padding(
                    padding: EdgeInsets.only(top: 5.0,left: 3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "The file is not clear",
                        style: StyleManager.warringTextStyle15,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  Icon( IconlyLight.document,
                    color: ColorsManager.primaryLight4,
                  ),
                  SizedBox(width: 8,),
                  Text("Graduation Certificate",
                    style: StyleManager.textStyle14,
                  ),
                  Spacer(),
                  !isClear? Icon(
                    Icons.done_rounded,
                    color: ColorsManager.primaryLight4,
                  ) : Icon(
                    IconlyBold.infoCircle,
                    color: ColorsManager.red,
                  ),

                ],
              ),
              if(isClear)
                Padding(
                  padding: EdgeInsets.only(top: 5.0,left: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "The file is not clear",
                      style: StyleManager.warringTextStyle15,
                    ),
                  ),
                ),
            ],
          ),

        ],
      ),
    );
  }
}
