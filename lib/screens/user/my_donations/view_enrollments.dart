import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/adoption_consts.dart';
import 'package:the_walking_pets/model/animal/donation.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';
import 'package:the_walking_pets/screens/user/my_donations/enrollment_detail.dart';
import 'package:the_walking_pets/utilities/services/adoption_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/circular_loading.dart';

class ViewEnrollments extends StatefulWidget {
  const ViewEnrollments({Key? key, required this.donation}) : super(key: key);

  final DonationClass donation;

  @override
  _ViewEnrollmentsState createState() => _ViewEnrollmentsState();
}

class _ViewEnrollmentsState extends State<ViewEnrollments> {
  bool isLoading = false;
  bool requestError = false;
  List<Enrollment> _enrollments = [];

  @override
  void initState() {
    super.initState();
    _getDonationList();
  }

  _getDonationList() {
    isLoading = true;

    AdoptionAPI.getEnrollmentList(widget.donation.id!).then((response) {
      var body = json.decode(response.body);

      setState(() {
        isLoading = false;

        if (response.statusCode == 200) {
          _enrollments = body['adoption_enrollment'] != null
              ? body['adoption_enrollment']
                  .map<Enrollment>((json) => Enrollment.fromJson(json))
                  .toList()
              : [];
        } else {
          requestError = true;
          SnackBar snackBar = SnackBar(
            content: Text('Erro: ${body['error'].toString()}'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulários'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? const CircularLoading()
            : _enrollments.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(requestError
                          ? 'Erro ao listar animais cadastrados'
                          : 'Não há Pets cadastrados'),
                      if (!requestError)
                        ElevatedButton(
                          child: const Text('Adicionar Pet'),
                          onPressed: () {},
                        )
                      else
                        ElevatedButton(
                            child: const Text('Voltar'),
                            onPressed: () => Navigator.pop)
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    itemCount: _enrollments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.list_alt),
                        title: Text(
                          _enrollments[index].user!.name.toUpperCase(),
                        ),
                        subtitle: Text(
                          AdoptionConsts().status[_enrollments[index].status!],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnrollmentDetail(
                                enrollment: _enrollments[index]),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
      ),
    );
  }
}
