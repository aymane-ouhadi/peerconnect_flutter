import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/GroupSearchModel.dart';
import 'package:peerconnect_flutter/services/GroupService.dart';
import 'package:peerconnect_flutter/widgets/empty_state.dart';
import 'package:peerconnect_flutter/widgets/search_bar.dart';
import 'package:peerconnect_flutter/widgets/search_group_card.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:peerconnect_flutter/services/UIService.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';

class Search extends StatefulWidget {

  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String query = "";

  List<GroupSearchModel> groups = [];

  bool isFetching = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UIService.buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                TopBar(isRoot: true),
                SearchBar(
                  value: query, 
                  onChanged: (value){
                    query = value;
                    GroupService.fetchGroups(query, "643d8b0a64d5b15895af8a26").then(
                      (value) {
                        setState(() {
                          groups = value;
                          isFetching = false;
                        });
                      }
                    );
                    // print("query : " + query);
                  },
                  hintText: "Search for groups by their names"
                ),
                SizedBox(height: 40),
                Container(
                  child: query == ""
                  ?
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: EmptyState(
                        image: "assets/images/illustration_search.png", 
                        width: 120,
                        title: "Search for Groups Here",
                        description: "Look for Groups in the Search Bar",
                      ),
                    ) 
                  :
                    isFetching
                    ?
                      Container(
                        child: CircularProgressIndicator(value: null),
                      )
                    :
                      groups.isNotEmpty
                      ?
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              ...groups.map((group){
                                return SearchGroupCard(
                                  group: group,
                                );
                              }),
                            ],
                          ),
                        )
                      :
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          child: EmptyState(
                            image: "assets/images/emptystate_news.png", 
                            title: "No Groups Found",
                            description: "There are no groups with the name $query",
                          ),
                        ) 
                  ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}