import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:peerconnect_flutter/utils/samples.dart';

class EventCard extends StatefulWidget {

  final Event event;


  EventCard({
    Key? key,
    required this.event
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  List<User> attendees = Samples.fetchAttendees(1);

  User authenticatedUser = Samples.fetchAuthenticatedUser();

  void handleAttendance() {
    //Don't forget to add the HTTP request for attendance
    setState(() {
      if(attendees.contains(authenticatedUser)){
        attendees.removeWhere((attendee) => attendee.id == authenticatedUser.id);
      }
      else{
        attendees.add(authenticatedUser);
      }
      // print("attendees : $attendees");
    });
  }

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
            child: Container(child: Placeholder(), height: 150),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EventTop(title: widget.event.title, date: ComfortService.formatDate(widget.event.eventDate)),
                EventCenter(attendees: attendees, description: widget.event.description),
                EventBottom(isGoing: attendees.contains(authenticatedUser), handleAttendance: handleAttendance)
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

  final List<User> attendees;

  const EventCenter({
    Key? key,
    required this.description, 
    required this.attendees
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("$attendees"),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: Row(
              children: [
                //I should add the attendees bubbles here
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                  attendees.length <= 1
                  ?
                    "Be the first one to attend this event"
                  :

                    "${attendees.length} people are going to the event"
                ),
              ],
            ),
          ),
          Text(
            Helpers.substring(description, 130),
            style: TextStyle(
              color: Colors.grey[800]
            ),
          )
        ],
      ),
    );
  }
}

class EventBottom extends StatefulWidget {

  final bool isGoing;

  final Function handleAttendance;

  const EventBottom({
    Key? key,
    required this.isGoing, 
    required this.handleAttendance
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
            elevation: 3
          )
        :
          ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            elevation: 3
          ),
        onPressed: (){
          setState(() {
            isGoing = !isGoing;
            widget.handleAttendance();
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