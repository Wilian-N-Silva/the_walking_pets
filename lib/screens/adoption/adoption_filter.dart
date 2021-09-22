import 'package:flutter/material.dart';

class AdoptionFilter extends StatefulWidget {
  const AdoptionFilter({Key? key}) : super(key: key);

  @override
  _AdoptionFilterState createState() => _AdoptionFilterState();
}

class _AdoptionFilterState extends State<AdoptionFilter> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Limpar',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
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
                          _currentSliderValue.round() < 100
                              ? 'Até ${(_currentSliderValue.round() == 0 ? 5 : _currentSliderValue.round()).toString()} km'
                              : 'Até ou acima de 100 km',
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('5 k'),
                            Text('100+ km'),
                          ],
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
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
