import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/User.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/utils/helpers.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/utils/samples.dart';
import 'package:provider/provider.dart';

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
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                widget.event.picture, 
                fit: BoxFit.cover,
                width: double.infinity,
              )
              // child: Container(child: Placeholder(), height: 150),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventTop(title: widget.event.title, date: ComfortService.formatDate(widget.event.eventDate)),
                  EventCenter(attendees: attendees, description: widget.event.description, userId: widget.event.userId,),
                  EventBottom(isGoing: attendees.contains(authenticatedUser), handleAttendance: handleAttendance, userId: widget.event.userId,)
                ],
              ),
            ),
          ],
        ),
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

class EventCenter extends StatefulWidget {

  final String description;

  final List<User> attendees;

  final String userId;

  const EventCenter({
    Key? key,
    required this.description, 
    required this.attendees, 
    required this.userId
  }) : super(key: key);

  @override
  State<EventCenter> createState() => _EventCenterState();
}

class _EventCenterState extends State<EventCenter> {

  bool readMore = false;

  final MAX = 100;

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
                widget.userId == Provider.of<AuthProvider>(context, listen: false).user.id
                ?
                  Container(height: 0,)
                :
                  Text(
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                    widget.attendees.length <= 1
                    ?
                      "Be one of first to attend this event"
                    :

                      "${widget.attendees.length} people are going to the event"
                  ),
              ],
            ),
          ),
          Text(
            !readMore ? Helpers.substring(widget.description, MAX) : widget.description,
            style: TextStyle(
              color: Colors.grey[800]
            ),
          ),
          widget.description.length > MAX
          ?
          GestureDetector(
            onTap: (){
              
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Text(
                readMore ? "Show Less": "Show More",
                textAlign: TextAlign.center,
                style: TextStyle(color: MyColors.primaryColor),
              ),
            )
          )
          :
          Container(
            width: 0,
            height: 0,
          )
          
        ],
      ),
    );
  }
}

class EventBottom extends StatefulWidget {

  final bool isGoing;

  final Function handleAttendance;
  
  final String userId;

  const EventBottom({
    Key? key,
    required this.isGoing, 
    required this.handleAttendance, 
    required this.userId
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
      child: 
      widget.userId != Provider.of<AuthProvider>(context, listen: false).user.id
      ?      
      ElevatedButton(
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
      )
      :
      null
    );
  }
}