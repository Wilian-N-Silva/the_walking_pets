import 'package:flutter/material.dart';
import 'package:the_walking_pets/data/partners/partner_category_data.dart';
import 'package:the_walking_pets/model/services/service_category.dart';
import 'package:the_walking_pets/model/services/service_filter.dart';

class PartnersFilter extends StatefulWidget {
  const PartnersFilter({Key? key, required this.currentFilter})
      : super(key: key);

  final Filter currentFilter;
  @override
  _PartnersFilterState createState() => _PartnersFilterState();
}

class _PartnersFilterState extends State<PartnersFilter> {
  final Filter defaultFilter = Filter(maxDistance: 1, categories: []);

  @override
  Widget build(BuildContext context) {
    Filter _currentFilter = widget.currentFilter;

    Widget customFilterChip(String label, IconData icon) {
      return FilterChip(
        avatar: CircleAvatar(
          child: Icon(
            icon,
            color: _currentFilter.categories.contains(label)
                ? Colors.white
                : Colors.black,
          ),
          backgroundColor: Colors.transparent,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: _currentFilter.categories.contains(label)
                ? Colors.white
                : Colors.black,
          ),
        ),
        selectedColor: Colors.blue,
        selected: _currentFilter.categories.contains(label),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _currentFilter.categories.add(label);
            } else {
              _currentFilter.categories.removeWhere((String name) {
                return name == label;
              });
            }
          });
        },
      );
    }

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
                  const SizedBox(height: 16.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tipos de Serviços',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: partnerCategoryData(context)
                        .map(
                          (e) => customFilterChip(e.titulo, e.icone),
                        )
                        .toList(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
