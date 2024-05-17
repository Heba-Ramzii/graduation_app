import 'package:flutter/material.dart';

import '../theme_manager/colors_manager.dart';
import '../theme_manager/style_manager.dart';

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

// This function is triggered by a user action, like pressing a button
showMyDialog(BuildContext context,
    String title, String text,Function()? onPressed)  {
   return showDialog<void>(
    context: context,
    barrierDismissible: false, // The user must tap a button to close the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorsManager.white,
        title:  Text(
          title,
          textAlign: TextAlign.center,
          style: StyleManager.textStyle12.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
           ),
        ),
        content:  Text(
            "Are you sure ?",
          textAlign: TextAlign.center,
          style: StyleManager.mainTextStyle15.copyWith(
            fontSize: 20,
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 20,bottom: 45),// Message which will be pop up on the screen
        actions: <Widget>[
          MaterialButton(
            minWidth: 140,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(50.0))),
            color:const Color(0xffBFD5F4) ,
            onPressed:  (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                  "Cancel",
                  style: StyleManager.buttonTextStyle16.copyWith(
                    color: ColorsManager.primary
                  )
              ),
            ),
          ),
          const SizedBox(width: 20,),
          MaterialButton(
            minWidth: 140,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(50.0))),
            color:ColorsManager.primary ,
             onPressed:onPressed,
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                  text,
                  style: StyleManager.buttonTextStyle16.copyWith()
              ),
            ),
          ),
         ],
      );
    },
  );
}



