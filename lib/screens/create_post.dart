import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerconnect_flutter/models/CreatePostModel.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/services/PostService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/bottom_action.dart';
import 'package:peerconnect_flutter/widgets/image_input.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';
import 'package:peerconnect_flutter/models/Post.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  
  CreatePostModel createPostModel = CreatePostModel.empty();

  bool isFetching = false;

  Map<String, String>? arguments;

  XFile? picture; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {      

      arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      createPostModel.userId = arguments!["userId"] as String;
      createPostModel.groupId = arguments!["groupId"] as String;

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
                SectionHeader(name: "Create Post"),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Title",
                  value: createPostModel.title,
                  onChanged: (value) {
                    createPostModel.title = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Description",
                  value: createPostModel.description,
                  onChanged: (value) {
                    createPostModel.description = value;
                  },
                ),
                const SizedBox(height: 40),
                ImageInput(
                  hintText: "Picture",
                  onChanged: (XFile? file) {
                    picture = file;
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
                  child: Text(isFetching ? "Posting..." : "Post to the group"),
                  onPressed: () async {
                      setState(() {
                        isFetching = true;
                      });

                      //Saving the post picture
                      String picturePath = await ComfortService.saveFile(
                        picture,
                        Constants.uploadedPostsBase
                      );

                      setState(() {
                        createPostModel.picture = picturePath;
                      });

                      print("Data : $createPostModel");
                      PostService.createPost(createPostModel as CreatePostModel).then(
                        (value){
                          //Status code
                          setState(() {
                            isFetching = false;                            
                          });
                          print("post status: $value");
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