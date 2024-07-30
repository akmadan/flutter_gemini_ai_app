import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:Syllout/bloc/chat_bloc.dart';
import 'package:Syllout/models/chat_message_model.dart';

class CourseCreater extends StatefulWidget {
  const CourseCreater({super.key, required this.text});
  final String text;

  @override
  State<CourseCreater> createState() => _CourseCreaterState();
}

class _CourseCreaterState extends State<CourseCreater> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Dispatch the event with the passed text when the screen opens
    chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: widget.text));
  }

  List<TextSpan> parseText(String text) {
    final RegExp regex = RegExp(r'(\*\*.*?\*\*)');
    final List<TextSpan> spans = [];
    final Iterable<RegExpMatch> matches = regex.allMatches(text);

    int start = 0;

    for (final RegExpMatch match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }

      final String matchText = match.group(0)!.substring(2, match.group(0)!.length - 2);
      spans.add(TextSpan(text: matchText, style: TextStyle(fontWeight: FontWeight.bold)));

      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages = (state as ChatSuccessState).messages;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black, BlendMode.difference),
                    opacity: 0.5,
                    image: AssetImage("assets/space_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
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
                              fontFamily: 'SixtyFour',fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        
                        ],
                      ),
                    ),
                    Expanded(
                      child:  ListView.builder(
                        itemCount: messages.isEmpty ? messages.length : messages.length - 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromARGB(255, 7, 25, 21).withOpacity(0.5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messages[index + 1].role == "user" ? "User" : "Syllout",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: messages[index + 1].role == "user"
                                        ? Colors.amber
                                        : Color.fromARGB(255, 23, 192, 207),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SelectableText.rich(
                                  TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    children: parseText(messages[index + 1].parts.first.text),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatBloc.generating)
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Lottie.asset('assets/loader.json'),
                          ),
                          const SizedBox(width: 20),
                          Text("Loading..."),
                        ],
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              maxLines: 6,
                              minLines: 1,
                              decoration: InputDecoration(
                                
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                fillColor: Colors.white,
                                hintText: "Coustomize Your Course",
                                hintStyle: TextStyle(color: Colors.grey.shade400),
                                filled: true,
                                
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(Icons.send, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  }
}
