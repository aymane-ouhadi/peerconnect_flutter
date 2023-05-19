import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/Event.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/PostService.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/services/eventService.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';
import 'package:peerconnect_flutter/widgets/event_card.dart';
import 'package:peerconnect_flutter/widgets/post_card.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/utils/samples.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Event> recentEvents = List.empty();
  List<Post> recentPosts = List.empty();
  bool isFetching = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    setState(() {
      
      AuthProvider provider = Provider.of<AuthProvider>(context, listen: false);

      EventService.fetchRecentEvents(provider.user.id).then(
        (value) {
          setState(() {
            isFetching = false;
            recentEvents = value;
          });
        }
      );
      PostService.fetchRecentPosts(provider.user.id).then(
        (value) {
          setState(() {
            isFetching = false;
            recentPosts = value;
          });
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (BuildContext context, AuthProvider provider, Widget? widget) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    TopBar(isRoot: true),
                    // Text(provider.user.toString()),
                    SectionHeader(
                      name: "Events",
                      action: {
                        "/events": recentEvents
                      }
                    ),
                    isFetching
                    ?
                      CircularProgressIndicator(
                        value: null,
                      )
                    :
                      recentEvents.length <= 0 
                      ? 
                        EmptyState(
                          image: "assets/images/emptystate_events.png",
                          title: "No events",
                          description: "This is your chance to chill",
                        )   
                      :
                        EventCard(event: recentEvents[0])
                      ,
                    SectionHeader(
                      name: "Posts",
                      action: {
                        "/posts": recentPosts
                      }
                    ),
                    isFetching
                    ?
                     CircularProgressIndicator(
                        value: null,
                      )
                    :
                      recentPosts.length <= 0 
                      ? 
                        EmptyState(
                          image: "assets/images/emptystate_news.png",
                          title: "No posts",
                          description: "You're all caught up",
                        )   
                      :
                        PostCard(post: recentPosts[0])
                      ,
                      SizedBox(height: 50,)
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}