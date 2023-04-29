import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/services/eventService.dart';
import 'package:peerconnect_flutter/widgets/event_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/utils/samples.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<Event>> recentEvents;

  @override
  void initState() {
    super.initState();
    // recentEvents = EventService.fetchRecentEvents("643d8b0a64d5b15895af8a26");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: true),
                SectionHeader(
                  name: "Events",
                  action: "/events"
                ),
                EventCard(event: Samples.fetchEvents(5).first),
                SectionHeader(
                  name: "Posts",
                  action: "/posts"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}