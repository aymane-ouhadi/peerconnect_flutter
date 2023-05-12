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

    String userId = (ModalRoute.of(context)!.settings.arguments as Map)["userId"];
    String groupId = (ModalRoute.of(context)!.settings.arguments as Map)["groupId"];

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
                onPressed: (){
                  Navigator.pushNamed(
                    context, 
                    "/create_post",
                    arguments: {
                      "userId": userId,
                      "groupId": groupId,
                    }
                  );
                },
              ),
              ChoiceCard(
                image: "assets/images/create_event.png",
                title: "Create an Event",
                description: "Gather your friends and live a great memory, set up an event and have a good time",
                onPressed: (){
                  Navigator.pushNamed(
                    context, 
                    "/create_event",
                    arguments: {
                      "userId": userId,
                      "groupId": groupId,
                    }
                  );
                },
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