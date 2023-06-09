import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/widgets/event_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class Events extends StatelessWidget {
  
  const Events({super.key});

  @override
  Widget build(BuildContext context) {

    // List<Event> recentEvents = Samples.fetchEvents(5);
    List<Event> recentEvents = ModalRoute.of(context)!.settings.arguments as List<Event>;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: false),
                SectionHeader(name: "Recent Events"),
                ...recentEvents.map((event) => Column(
                  children: [
                    EventCard(event: event),
                    SizedBox(height: 40,)
                  ],
                )).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}