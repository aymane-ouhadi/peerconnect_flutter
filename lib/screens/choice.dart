import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/choice_card.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: PageView(
            controller: PageController(viewportFraction: 1),

            children: [
              ChoiceCard(
                image: "assets/images/create_post.png",
                title: "Create a Post",
                description: "Publish a Post in the group to let your friends know what you're up to",
                onPressed: (){},
              ),
              ChoiceCard(
                image: "assets/images/create_event.png",
                title: "Create an Event",
                description: "Gather your friends and live a great memory, set up an event and have a good time",
                onPressed: (){},
              ),
            ],
          ),
          // child: Column(
          //   children: [
          //     EmptyState(
          //       image: "assets/images/create_event.png", 
          //       title: "Create a",
          //       description: "",
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}