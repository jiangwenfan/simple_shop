import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddArticleView extends GetView {
  AddArticleView({Key? key}) : super(key: key);

  String name = "";
  int category = 0;
  String raw_content = "";
  String raw_translate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddArticleView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "文章标题名"),
              onChanged: (value) {
                name = value;
              },
            ),
            // DropdownButton<String>(
            //   value: selectedValue,
            //   onChanged: (newValue) {
            //     print(newValue);
            //   },
            //   items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            TextField(
              decoration: InputDecoration(hintText: "文章分类id"),
              onChanged: (value) {
                print(value);
                category = int.parse(value);
                print(category);
              },
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(hintText: "文章 raw_content"),
              onChanged: (value) {
                raw_content = value;
              },
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(hintText: "文章 raw_translate"),
              onChanged: (value) {
                raw_translate = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print("${name} ${category} ${raw_content} ${raw_translate}");
                },
                child: Text("提交"))
          ],
        ));
  }
}
