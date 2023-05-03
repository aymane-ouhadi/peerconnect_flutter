import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/widgets/bottom_sheet.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget {

  final bool isRoot;

  const TopBar({
    Key? key,
    required this.isRoot
  }) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isRoot ? 
            Container(
              width: 40,
              child: Image.asset("assets/images/icon.png"),
            ) 
          : 
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: MyColors.primaryColor,
                size: 30,
              ),
            ),

          GestureDetector(
            onTap: (){
              print("avatar press");
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(  
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                builder: (BuildContext context) {
                  return MyBottomSheet();
                },
              );
            },
            child: Container(
              width: 50,
              height: 60,
              child: Image.asset("assets/images/avatar.png")
            ),
          )
        ],
      ),
    );
  }
}