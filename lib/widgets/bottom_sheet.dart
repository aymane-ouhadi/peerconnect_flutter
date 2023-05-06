import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/bottom_sheet_element.dart';

class MyBottomSheet extends StatelessWidget {

  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MyColors.primaryColor, width: 6),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 8,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 50,),
              ...Constants.bottomSheetOptions.map(
                (option){
                  return BottomSheetElement(
                    option: option
                  );
                }
              )
            ],
          ),
        ),
      ),
      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       const Text('Modal BottomSheet'),
      //       ElevatedButton(
      //         child: const Text('Close BottomSheet'),
      //         onPressed: () => Navigator.pop(context),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}