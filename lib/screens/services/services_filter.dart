import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/services/service_filter.dart';

class ServicesFilter extends StatefulWidget {
  const ServicesFilter({Key? key, required this.currentFilter})
      : super(key: key);

  final Filter currentFilter;
  @override
  _ServicesFilterState createState() => _ServicesFilterState();
}

class _ServicesFilterState extends State<ServicesFilter> {
  final Filter defaultFilter = Filter(maxDistance: 1);

  @override
  Widget build(BuildContext context) {
    Filter _currentFilter = widget.currentFilter;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _currentFilter = defaultFilter;
              });
            },
            child: const Text(
              'Limpar',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            child: const Text('Filtrar'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                const Size(128, 48.0),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.blue.shade400,
              ),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context, _currentFilter);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Distância',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          '${_currentFilter.maxDistance.round()} km',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('1 km'),
                            Text('100 km'),
                          ],
                        ),
                        Slider(
                          value: _currentFilter.maxDistance,
                          min: 1,
                          max: 100,
                          onChanged: (double value) {
                            setState(() {
                              _currentFilter.maxDistance = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
