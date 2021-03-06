import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/constants/adoption_consts.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';
import 'package:the_walking_pets/utilities/helpers/age_helpers.dart';
import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';

class EnrollmentData {
  EnrollmentData({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
}

class EnrollmentDetail extends StatefulWidget {
  const EnrollmentDetail({Key? key, required this.enrollment})
      : super(key: key);

  final Enrollment enrollment;

  @override
  _EnrollmentDetailState createState() => _EnrollmentDetailState();
}

class _EnrollmentDetailState extends State<EnrollmentDetail> {
  String? _status;

  _handleStatus(String? value) {
    _status = value;
  }

  @override
  void initState() {
    _status = AdoptionConsts().status.elementAt(widget.enrollment.status!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<EnrollmentData> tileDataSource = [
      EnrollmentData(
        title: 'Nome completo',
        subtitle: widget.enrollment.user!.name.toString(),
      ),
      EnrollmentData(
        title: 'Idade',
        subtitle:
            '${ageFormatter(widget.enrollment.user!.birth!)} (${DateFormat('dd/MM/yyyy').format(widget.enrollment.user!.birth!).toString()})',
      ),
      EnrollmentData(
        title: 'E-mail',
        subtitle: widget.enrollment.user!.email.toString(),
      ),
      EnrollmentData(
        title: 'Telefone Fixo',
        subtitle: widget.enrollment.user!.phone.toString(),
      ),
      EnrollmentData(
        title: 'Telefone Celular',
        subtitle: widget.enrollment.user!.cellphone.toString(),
      ),
      EnrollmentData(
        title: 'Quantas pessoas moram com você?',
        subtitle: widget.enrollment.numResidents.toString(),
      ),
      EnrollmentData(
        title: 'Área de atuação profissional',
        subtitle: AdoptionConsts()
            .jobCategories
            .elementAt(widget.enrollment.jobCategoryId - 1),
      ),
      EnrollmentData(
        title: 'Tem filhos?',
        subtitle: widget.enrollment.haveChild ? 'Sim' : 'Não',
      ),
      EnrollmentData(
        title: 'Já adotou algum animal?',
        subtitle: widget.enrollment.alreadyAdopted ? 'Sim' : 'Não',
      ),
      EnrollmentData(
        title: 'Durante viagens, onde deixará o animal?',
        subtitle: AdoptionConsts()
            .onTravel
            .elementAt(widget.enrollment.onTravelId - 1),
      ),
      EnrollmentData(
        title: 'Mora em casa ou apartamento?',
        subtitle: AdoptionConsts()
            .houseType
            .elementAt(widget.enrollment.houseTypeId - 1),
      ),
      EnrollmentData(
        title: 'É proprietário da casa onde mora?',
        subtitle: widget.enrollment.houseOwnership ? 'Sim' : 'Não',
      ),
      EnrollmentData(
        title: 'Status atual:',
        subtitle: AdoptionConsts().status.elementAt(widget.enrollment.status!),
      ),
    ];

    _statusDialog() {
      return AlertDialog(
        title: const Text('Mudança de Status'),
        content: CustomDropdown(
          label: 'Status',
          selected: _status,
          items: AdoptionConsts().status,
          handler: _handleStatus,
        ),
        actions: [
          TextButton(
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          TextButton(
            child: const Text('Salvar'),
            onPressed: () {},
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceAround,
      );
    }

    // _saveStatus() {}

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(tileDataSource[index].title),
                  subtitle: Text(tileDataSource[index].subtitle),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            ElevatedButton(
              child: const Text('Mudança de Status'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _statusDialog(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
