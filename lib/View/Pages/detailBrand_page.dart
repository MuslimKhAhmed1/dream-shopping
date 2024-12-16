import 'package:dream_shopping/Controller/controller.dart';
import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailbrandPage extends StatefulWidget {
  const DetailbrandPage(
      {super.key, required this.brandName, required this.brandlogo});

  final String brandName;
  final String brandlogo;

  @override
  State<DetailbrandPage> createState() => _DetailbrandPageState();
}

class _DetailbrandPageState extends State<DetailbrandPage> {
  final Set<int> _selectedIndices = {};

  final List<String> _options = [
    'Nature',
    'Tech',
    'Traditions',
    'Philosophy',
    'Art',
  ];
  final Brands brands = Brands();

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.GoldCol,
        title: Text(
          widget.brandName,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          // Show total quantity at the top
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Items: ${counterProvider.totalQuantity}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 310,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    hintText: "Search for brands",
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                _options.length,
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ChoiceChip(
                      label: Text(_options[index]),
                      selected: _selectedIndices.contains(index),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedIndices.add(index);
                          } else {
                            _selectedIndices.remove(index);
                          }
                        });
                      },
                      selectedColor: AppColors.lblueCol,
                      backgroundColor: Colors.grey[300],
                      labelStyle: TextStyle(
                        color: _selectedIndices.contains(index)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4 / 5,
              ),
              itemCount: brands.oil.length,
              itemBuilder: (context, index) {
                final entry = brands.oil[index].entries.first;
                final brandName = entry.key;
                final brandImagePath = entry.value;

                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 235, 235),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        brandImagePath,
                        height: 100,
                      ),
                      Text(brandName),
                      const SizedBox(height: 5),
                      const Text("Price: 10 IQD"),
                      IconButton(
                        onPressed: () {
                          counterProvider.addOrder(brandName, brandImagePath);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$brandName added')),
                          );
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
