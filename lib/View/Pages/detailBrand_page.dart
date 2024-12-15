import 'package:dream_shopping/Controller/controller.dart';
import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:dream_shopping/View/Pages/home_page.dart';
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
  final HomePage homePage = HomePage();
  final Brands brands = Brands();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.GoldCol,
        title: Text(
          widget.brandName.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
                              const BorderSide(color: Colors.grey, width: 1.5)),
                      hintText: "Search for brands"),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))
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
                      iconTheme: const IconThemeData(
                        color: Colors.black,
                        size: 20.0,
                      ),
                      selectedColor: AppColors.lblueCol,
                      backgroundColor: Colors.grey[300],
                      disabledColor: Colors.grey,
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 4 / 5, // Aspect ratio for grid tiles
              ),
              itemCount: brands.oil.length,
              itemBuilder: (context, index) {
                final entry = brands.oil[index].entries.first;
                final brandName = entry.key; // The brand name
                final brandImagePath = entry.value; // The image path

                return GestureDetector(
                  onTap: () {
                    BottomSheet(context, brandImagePath, brandName);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 235, 235),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Consumer<CounterProvider>(
                      builder: (context, value, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            brandImagePath,
                            height: 100,
                          ),
                          Text(brandName),
                          SizedBox(
                            height: 5,
                          ),
                          Text("cartoon: 0 IQD"),
                          Text("Price: 0 IQD"),
                          SizedBox(
                            height: 5,
                          ),
                          IconButton(
                              onPressed: () {
                                CounterProvider().increment();
                                print(CounterProvider().order);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> BottomSheet(BuildContext context, String img, String name) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 242, 235, 235),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          height: 400,
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 7,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  img,
                  height: 240,
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "1*4 (1/5)",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
