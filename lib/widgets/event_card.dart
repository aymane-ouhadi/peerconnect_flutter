import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';

class EventCard extends StatelessWidget {

  final Event event;

  const EventCard({
    Key? key,
    required this.event  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // child: Image.asset(
            //   "assets/images/barbecue.png", 
            //   width: double.infinity,
            // )
            child: Container(child: Placeholder(), height: 150,),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventTop(title: event.title, date: event.eventDate),
                EventCenter(description: event.description),
                EventBottom(isGoing: false,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Helper widgets

class EventTop extends StatelessWidget {


  final String title;
  final String date;

  const EventTop({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Helpers.substring(title, 15),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Icon(Icons.calendar_month_outlined, size: 16, color: Colors.grey,),
              SizedBox(width: 5),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.grey
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class EventCenter extends StatelessWidget {

  final String description;

  const EventCenter({
    Key? key,
    required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        style: TextStyle(
          color: Colors.grey[800]
        ),
        Helpers.substring(description, 130)
      ),
    );
  }
}

class EventBottom extends StatefulWidget {

  final bool isGoing;

  const EventBottom({
    Key? key,
    required this.isGoing
  }) : super(key: key);

  @override
  State<EventBottom> createState() => _EventBottomState();
}

class _EventBottomState extends State<EventBottom> {

  late bool isGoing;

  @override
  void initState() {
    super.initState();
    isGoing = widget.isGoing;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: isGoing 
        ?
          ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.green,
            elevation: 0
          )
        :
          ElevatedButton.styleFrom(
            primary: Colors.green,
            elevation: 0
          ),
        onPressed: (){
          setState(() {
            isGoing = !isGoing;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isGoing
              ?
                Icon(Icons.check_circle_outline)
              :
                Icon(Icons.celebration_outlined),
              SizedBox(width: 10),
              isGoing
              ?
                Text("Already Going")
              :
                Text("Up for it")
            ],
          ),
        ),
      ),
    );
  }
}