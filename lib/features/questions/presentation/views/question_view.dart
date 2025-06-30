import 'package:dopa_fit/features/questions/presentation/widgets/question_view_body.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  static const String routeName = '/question';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: QuestionViewBody()));
  }
}
