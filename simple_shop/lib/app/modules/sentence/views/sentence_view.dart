import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sentence_controller.dart';

class SentenceView extends GetView<SentenceController> {
  const SentenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SentenceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SentenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
