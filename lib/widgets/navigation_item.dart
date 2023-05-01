import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';

class MyNavigationItem extends StatefulWidget {

  final MapEntry<String, Map<String, Function>> route;

  const MyNavigationItem({
    Key? key,
    required this.route
  }) : super(key: key);

  @override
  State<MyNavigationItem> createState() => _MyNavigationItemState();
}

class _MyNavigationItemState extends State<MyNavigationItem> {

  String? _currentRoute;
  bool isActive = false;

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _currentRoute = ModalRoute.of(context)?.settings.name;
      });
    });
    // setState(() {
    //   if(widget.route.)
    // });
    
  }

  @override
  Widget build(BuildContext context) {

    // print(_currentRoute);


    //Checking if the current is the same as the icon to activate it
    setState(() {
      isActive = (_currentRoute == widget.route.key);
    });



    return Container(
      child: Column(
        children: [
          IconButton(
            icon: widget.route.value.values.first(isActive),
            onPressed: () {
              setState(() {
                // isActive = !isActive;
                Navigator.pushReplacementNamed(context, widget.route.key);
                // print("target : ${widget.route.key}");
              });
            },
          ),
          Text(
            widget.route.value.keys.first,
            style: TextStyle(
              color: isActive ? MyColors.primaryColor : Colors.black
            ),  
          ),             
        ],
      ),
    );
  }
}