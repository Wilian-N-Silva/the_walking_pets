import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';

class AdoptionStatus {
  AdoptionStatus({
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
}

class AdoptionProgress extends StatefulWidget {
  const AdoptionProgress({Key? key, required this.enroll}) : super(key: key);

  final Enrollment enroll;

  @override
  _AdoptionProgressState createState() => _AdoptionProgressState();
}

class _AdoptionProgressState extends State<AdoptionProgress> {
  @override
  Widget build(BuildContext context) {
    // 0 - Aguardando Triagem
    // 1 - Aguardando Entrevista
    // 2 - Aguardando resultados
    // 3 - Aprovado
    // 4 - Reprovado

    final List<AdoptionStatus> tileDataSource = [
      AdoptionStatus(
        title: 'Aguardando Triagem',
        description:
            'Seu formulário está com o responsável do animal e será avaliado',
      ),
      AdoptionStatus(
        title: 'Aguardando Entrevista',
        description:
            'Você foi aprovado no processo de triagem. Logo o responsável entrará em contato para uma entrevista!',
      ),
      AdoptionStatus(
        title: 'Aguardando Resultado',
        description: 'Tudo pronto. Agora ',
      ),
      AdoptionStatus(
        title: 'Resultado',
        description: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progresso de adoção'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    width: 150.0,
                    height: 150.0,
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Hero(
                        transitionOnUserGestures: false,
                        tag: widget.enroll,
                        child: widget.enroll.adoption!.animal!.photo!.isNotEmpty
                            ? NetworkImageHandler(
                                animal: widget.enroll.adoption!.animal!,
                              )
                            : Container(
                                color: Theme.of(context).primaryColor,
                                child: const Icon(
                                  FA5Pets.dog,
                                  size: 64.0,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.enroll.status! >= 3,
                  child: Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width / 3 + 96,
                    child: Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                        color: widget.enroll.status! == 3
                            ? Colors.green.shade300
                            : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.enroll.status! == 3
                            ? Icons.favorite
                            : Icons.close,
                        size: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            widget.enroll.status! < 3
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    itemCount: tileDataSource.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StatusTile(
                          index: index,
                          status: widget.enroll.status!,
                          data: tileDataSource[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      widget.enroll.status! == 3
                          ? 'Parabéns, você passou no processo de adoção!'
                          : 'Sentimos muito, mas você não passou no processo de adoção...',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class StatusTile extends StatefulWidget {
  const StatusTile({
    Key? key,
    required this.index,
    required this.status,
    required this.data,
  }) : super(key: key);

  final int index;
  final int status;
  final AdoptionStatus data;

  @override
  _StatusTileState createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.data.title),
      subtitle: Text(widget.data.description),
      isThreeLine: true,
      leading: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(Icons.check),
      ),
      enabled: widget.index <= widget.status ? true : false,
    );
  }
}
