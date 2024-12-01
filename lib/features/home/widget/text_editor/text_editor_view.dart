import 'package:digifly/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class TextEditorView extends StatefulWidget {
  const TextEditorView({super.key});

  @override
  State<TextEditorView> createState() => _TextEditorViewState();
}

TextAlign textAlign = TextAlign.left;
TextEditingController textController = TextEditingController();

class _TextEditorViewState extends State<TextEditorView> {
  void addBulletPoints() {
    List<String> lines = textController.text.split('\n');
    String formattedText = lines.map((line) => '• $line').join('\n');
    setState(() {
      textController.text = formattedText;
    });
  }

  void addNumberedList() {
    List<String> lines = textController.text.split('\n');
    String formattedText = lines
        .asMap()
        .entries
        .map((entry) => '${entry.key + 1}. ${entry.value}')
        .join('\n');
    setState(() {
      textController.text = formattedText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Text Editor",
            style: AppStyle.style16font700black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Introduce yourself", style: AppStyle.style16font700black),
              const SizedBox(height: 50),
              Container(
                color: const Color(0xffF1EFF9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.format_align_left),
                          onPressed: () {
                            setState(() {
                              textAlign = TextAlign.left;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_align_center),
                          onPressed: () {
                            setState(() {
                              textAlign = TextAlign.center;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_align_right),
                          onPressed: () {
                            setState(() {
                              textAlign = TextAlign.right;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_align_justify),
                          onPressed: () {
                            setState(() {
                              textAlign = TextAlign.justify;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_list_bulleted),
                          onPressed: addBulletPoints,
                        ),
                        IconButton(
                          icon: const Icon(Icons.format_list_numbered),
                          onPressed: addNumberedList,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: TextField(
                        controller: textController,
                        textAlign: textAlign,
                        maxLines: null,
                        style: AppStyle.style14font700black
                            .copyWith(fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          hintText: 'اكتب النص هنا...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
