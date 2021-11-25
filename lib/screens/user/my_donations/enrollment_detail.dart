import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';

class EnrollmentDetail extends StatefulWidget {
  const EnrollmentDetail({Key? key, required this.enrollment})
      : super(key: key);

  final Enrollment enrollment;

  @override
  _EnrollmentDetailState createState() => _EnrollmentDetailState();
}

class _EnrollmentDetailState extends State<EnrollmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(),
    );
  }
}
