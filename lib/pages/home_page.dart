import 'package:Syllout/pages/course_creater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:Syllout/bloc/chat_bloc.dart';
import 'package:Syllout/models/chat_message_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.5,
                        image: AssetImage("assets/space_bg.jpg"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 100,
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SyllOut",
                            style: TextStyle(
                              fontFamily: 'SixtyFour',
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          
                          
                        ],
                      ),
                    ),
                   Expanded(
                     child: Center(child: GestureDetector(
                      onTap:() {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(),
              );
            },
                       child: Container(
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.white,),borderRadius: BorderRadius.circular(30)),
                         child:const Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Icon(Icons.add,size:40),
                             Text(
                              "Create a New Course",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                           ],
                         ),)
                        ),
                     ),),
                  
                 
                   ),
                   
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }}

class CustomDialog extends StatefulWidget {
  
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
   final ChatBloc chatBloc = ChatBloc();
  final TextEditingController _answer1Controller = TextEditingController();
  final TextEditingController _answer2Controller = TextEditingController();
  final TextEditingController _answer3Controller = TextEditingController();

  @override
  void dispose() {
    _answer1Controller.dispose();
    _answer2Controller.dispose();
    _answer3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return  BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return  AlertDialog(
      title: Text('Create a Course'),
      content: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Title Of the course:'),
             SizedBox(height: 10),
            TextField(
              controller: _answer1Controller,
              decoration: InputDecoration(hintText: 'title'),
             
            ),
            SizedBox(height: 10),
            Text('Course Catagory'),
             SizedBox(height: 10),
            TextField(
              controller: _answer2Controller,
             
              decoration: InputDecoration(hintText: 'Technology'),
            ),
            SizedBox(height: 10),
            Text('Age Group'),
             SizedBox(height: 10),

            TextField(
              controller: _answer3Controller,
            
              decoration: InputDecoration(hintText: '16 to 30'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            String text ="Create a detailed course outline for a new course titled "+_answer1Controller.text.toString()+" that focuses on "+_answer2Controller.text.toString()+" for "+_answer3Controller.text.toString()+" students. Include the following: Learning Objectives: Clearly state the skills, knowledge, and abilities that students will gain by completing this course. Course Structure: Divide the course into modules, each focusing on a specific topic or theme. For each module, outline: Module Title Learning Outcomes Sub-Topics Content Ideas: Provide a list of content ideas for each module, including: Text-Based Content (explanations, concepts, examples) Visuals (images, infographics, charts) Interactive Elements (quizzes, simulations, games) Real-World Examples (case studies, current events) Activity Ideas: Suggest specific activities or projects that students can engage in to reinforce their learning. Assessment Methods: Outline how you will evaluate student learning, including the types of assessments (quizzes, projects, presentations) and their purpose. Additional Resources: List any external resources (websites, articles, videos) that might be helpful for students to explore. ";
           
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CourseCreater(text: text,)),
            );
          },
          child: Text('Next'),
        ),
      ],
    );
    default:
              return SizedBox();
          }});  }}