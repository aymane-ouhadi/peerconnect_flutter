import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peerconnect_flutter/models/CreateGroupModel.dart';
import 'package:peerconnect_flutter/provider/auth/AuthProvider.dart';
import 'package:peerconnect_flutter/services/ComfortService.dart';
import 'package:peerconnect_flutter/services/GroupService.dart';
import 'package:peerconnect_flutter/utils/constants.dart';
import 'package:peerconnect_flutter/utils/my_colors.dart';
import 'package:peerconnect_flutter/widgets/date_input.dart';
import 'package:peerconnect_flutter/widgets/image_input.dart';
import 'package:peerconnect_flutter/widgets/rule_card.dart';
import 'package:peerconnect_flutter/widgets/rule_input.dart';
import 'package:peerconnect_flutter/widgets/section_header.dart';
import 'package:peerconnect_flutter/widgets/text_input.dart';
import 'package:peerconnect_flutter/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreateGroupScreen> {
  
  CreateGroupModel createGroupModel = CreateGroupModel.empty();

  bool isFetching = false;

  XFile? picture;

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
                SectionHeader(name: "Create Group"),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Title",
                  value: createGroupModel.name,
                  onChanged: (value) {
                    createGroupModel.name = value;
                  },
                ),
                const SizedBox(height: 40),
                TextInput(
                  hintText: "Description",
                  value: createGroupModel.description,
                  onChanged: (value) {
                    createGroupModel.description = value;
                  },
                ),
                
                const SizedBox(height: 40),
                ImageInput(
                  hintText: "Picture",
                  onChanged: (XFile? file){
                    picture = file;
                  },
                ),
                const SizedBox(height: 40),
                RuleInput(
                  hintText: "Rules",
                  value: createGroupModel.description,
                  onChanged: (value) {
                    createGroupModel.description = value;
                  },
                  onSuffixIconTap: (String rule){
                    setState(() {
                      createGroupModel.rulesDescription.add(rule);
                    });
                  },
                ),
                const SizedBox(height: 40),
                ...createGroupModel.rulesDescription.map((rule) => RuleCard(
                  rule: rule, 
                  onCancelTap: (String rule){ 
                    setState(() {
                      createGroupModel.rulesDescription.remove(rule);
                    }); 
                  },
                )),
                const SizedBox(height: 40),
                // ImageInput(hintText: "Picture"),
                // const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    minimumSize: const Size(double.infinity, 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: MyColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(isFetching ? "Creating..." : "Create the group"),
                  onPressed: () async {
                    setState(() {
                      isFetching = true;
                    });

                    createGroupModel.adminId = Provider.of<AuthProvider>(context, listen: false).user.id;

                    //Saving the post picture
                    String picturePath = await ComfortService.saveFile(
                      picture,
                      Constants.uploadedGroupsBase
                    );

                    print("Data : $createGroupModel");

                    setState(() {
                      createGroupModel.picture = picturePath;
                    });

                    GroupService.createGroup(createGroupModel).then(
                      (value){
                        setState(() {
                          isFetching = false;
                        });
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