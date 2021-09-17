import 'package:flutter/material.dart';

class HomeFilter extends StatefulWidget {
  const HomeFilter({Key? key}) : super(key: key);

  @override
  _HomeFilterState createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  final List<bool> _selections = List.generate(3, (_) => true);
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Espécie',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                width: double.maxFinite,
                child: LayoutBuilder(builder: (context, constraints) {
                  return ToggleButtons(
                    constraints: BoxConstraints.expand(
                      width: (constraints.maxWidth / 3) - 2.0,
                      height: 50.0,
                    ),
                    children: const [
                      Text('Cães'),
                      Text('Gatos'),
                      Text('Exóticos'),
                    ],
                    onPressed: (index) {
                      setState(() {
                        _selections[index] = !_selections[index];
                      });
                    },
                    selectedColor: Colors.white,
                    fillColor: Colors.blue,
                    isSelected: _selections,
                  );
                }),
              ),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _currentSliderValue < 100
                    ? _currentSliderValue == 0
                        ? '5km'
                        : '${_currentSliderValue.round().toString()} km'
                    : '100+ km',
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
