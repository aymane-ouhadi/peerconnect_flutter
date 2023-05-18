import 'package:flutter/material.dart';
import 'package:peerconnect_flutter/models/CreateEventModel.dart';
import 'package:peerconnect_flutter/services/EventService.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/date_input.dart';
import 'package:peerconnect_flutter/widgets/image_input.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreateEventScreen> {
  
  CreateEventModel createEventModel = CreateEventModel.empty();

  bool isFetching = false;

  Map<String, String>? arguments; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {      

      arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      createEventModel.userId = arguments!["userId"] as String;
      createEventModel.groupId = arguments!["groupId"] as String;

    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text("$post"),
                TopBar(isRoot: false),
                SectionHeader(name: "Create Event"),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Title",
                  value: createEventModel.title,
                  onChanged: (value) {
                    createEventModel.title = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Description",
                  value: createEventModel.description,
                  onChanged: (value) {
                    createEventModel.description = value;
                  },
                ),
                
                const SizedBox(height: 40),
                ImageInput(hintText: "Picture"),
                const SizedBox(height: 40),
                DateInput(
                  hintText: "Pick a date, any date",
                  onTap: (String eventDate){
                    setState(() {
                      createEventModel.eventDate = eventDate;
                    });
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(double.infinity, 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: MyColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(isFetching ? "Publishing..." : "Publish to the group"),
                  onPressed: (){
                    setState(() {
                      isFetching = true;
                    });
                    EventService.createEvent(createEventModel).then(
                      (value){
                        //Status code
                        setState(() {
                          isFetching = false;
                        });
                        print(" create event status : $value");
                        Navigator.pushNamed(context, "/home");
                      }
                    );
                  }, 
                ),
                // BottomAction(
                //   question: "Already a member?",
                //   action: {"Login": Login()},
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}