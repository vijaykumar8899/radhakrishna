import 'package:flutter/material.dart';
import 'package:radhakrishna/Constants/HeightColor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbersList1 = [];
  List<int> numbersList2 = [];
  List<double> numbersList3 = [];

  List<double> numbersListResult = [5, 4, 0, 1.05, 144, 0, 0, 0];

  String selectedNumber1 = '5';
  String selectedNumber2 = '4';
  String selectedNumber3 = '1.05';
  double result_ = 0.0;

  void firstInitialization(List<int> numbersList) {
    for (int i = 1; i <= 8; i++) {
      numbersList.add(i);
    }
  }

  void secondInitialization(List<double> numbersList) {
    for (int i = 1; i <= 12; i++) {
      var num = i + 0.05;
      numbersList3.add(num);
    }
    // print("$numbersList3");
  }

  void Calculate() {
    print(" result : $numbersListResult");
    if (numbersListResult.length >= 2) {
      var mul =
          numbersListResult[0] * numbersListResult[1] * numbersListResult[3];

      setState(() {
        result_ = mul / 144;
      });
      print("Multiplication Result: $result_");
    } else {
      print("Not enough selected numbers to perform multiplication.");
    }

    // Reset numbersListResult after performing multiplication
    numbersListResult = [5, 4, 0, 1.05, 144, 0, 0, 0];
  }

  @override
  void initState() {
    super.initState();
    firstInitialization(numbersList1);
    firstInitialization(
        numbersList2); // Separate initialization for numbersList2
    secondInitialization(numbersList3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Radha Krishna",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                WoodContainer(
                  numbersList: numbersList1,
                  selectedNumber: selectedNumber1,
                  onValueChanges: (value) {
                    numbersListResult[0] = value.toDouble();
                    print("numberlist : $value");
                    print(numbersListResult);
                  },
                ),
                SpaceBox(),
                MultiplicationIcon(),
                SpaceBox(),
                //first end

                //second start
                WoodContainer(
                  numbersList:
                      numbersList2, // Use numbersList2 for the second WoodContainer
                  selectedNumber:
                      selectedNumber2, // Use selectedNumber2 for the second WoodContainer
                  onValueChanges: (value) {
                    numbersListResult[1] = value.toDouble();
                    print("numberlist2 : $value");
                    print("numberlistRes1 : ${numbersListResult}");
                  },
                ),
                SpaceBox(),
                MultiplicationIcon(),
                SpaceBox(),
                //second end
                //third start
                // WoodContainer(
                //   numbersList:
                //       numbersList2, // Use numbersList2 for the second WoodContainer
                //   selectedNumber:
                //       selectedNumber2, // Use selectedNumber2 for the second WoodContainer
                //   onValueChanges: (value) {
                //     numbersListResult[2] = value.toDouble();
                //     print("numberlist2 : $value");
                //     print("numberlistRes1 : ${numbersListResult}");
                //   },
                // ),
//third end
                //forth start
                // SpaceBox(),
                // MultiplicationIcon(),
                SpaceBox(),
                DropDownDouble(
                  numbersList:
                      numbersList3, // Use numbersList2 for the second WoodContainer
                  selectedNumber:
                      selectedNumber3, // Use selectedNumber2 for the second WoodContainer
                  onValueChanges: (value) {
                    numbersListResult[3] = value.toDouble();
                    print("numberlist2 : $value");
                    print("numberlistRes1 : ${numbersListResult}");
                  },
                ),
                //forth end
                //division symbol
                const Icon(
                  FontAwesomeIcons
                      .divide, // Using the "clear" icon for multiplication
                  size: 24,
                  color: Colors.black, // You can customize the color
                  weight: 10,
                ),
                //end division smbol
                //fifth start
                SpaceBox(),
                Container(
                  height: HeightAndColor.height,
                  width: HeightAndColor.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: HeightAndColor.primary,
                      width: 2.0,
                    ),
                    color: HeightAndColor.secondary,
                  ),
                  child: const Center(
                    child: Text(
                      "144",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                //fifth end
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: HeightAndColor.primary,
                    width: 2.0,
                  ),
                  color: HeightAndColor.secondary,
                ),
                child: TextButton(
                  onPressed: () {
                    Calculate();
                  },
                  child: const Text("Calculate"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: HeightAndColor.primary,
                  width: 2.0,
                ),
                color: HeightAndColor.secondary,
              ),
              child: Center(
                child: Text(
                  result_.toStringAsFixed(3),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WoodContainer extends StatefulWidget {
  final List<int> numbersList;
  final String selectedNumber;
  final Function(int) onValueChanges;

  WoodContainer({
    required this.numbersList,
    required this.selectedNumber,
    required this.onValueChanges,
  });

  @override
  _WoodContainerState createState() => _WoodContainerState();
}

class DropDownDouble extends StatefulWidget {
  final List<double> numbersList;
  final String selectedNumber;
  final Function(double) onValueChanges;

  DropDownDouble({
    required this.numbersList,
    required this.selectedNumber,
    required this.onValueChanges,
  });

  @override
  _DropDownDoubleState createState() => _DropDownDoubleState();
}

class _DropDownDoubleState extends State<DropDownDouble> {
  double selectedValue = 0;

  @override
  void initState() {
    super.initState();
    selectedValue = double.tryParse(widget.selectedNumber) ?? 0;
  }

  List<DropdownMenuItem<String>> generateDropdownItems(List<double> numbers) {
    return numbers.map((number) {
      return DropdownMenuItem(
        child: Text(number.toString()),
        value: number.toString(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = HeightAndColor.height;
    double width = HeightAndColor.width;
    Color woodColor = HeightAndColor.woodColor;
    Color primary = HeightAndColor.primary;
    Color secondary = HeightAndColor.secondary;
    Color third = HeightAndColor.third;

    return Container(
      height: height,
      width: width + 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: woodColor,
          width: 2.0,
        ),
        color: secondary,
      ),
      child: Center(
        child: DropdownButton(
          value: selectedValue.toString(),
          items: generateDropdownItems(widget.numbersList),
          dropdownColor: secondary,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          borderRadius: BorderRadius.circular(8.0),
          onChanged: (value) {
            setState(() {
              selectedValue = double.tryParse(value!) ?? 0.0;
              widget.onValueChanges(selectedValue);
            });
          },
        ),
      ),
    );
  }
}

class _WoodContainerState extends State<WoodContainer> {
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    selectedValue = int.tryParse(widget.selectedNumber) ?? 0;
  }

  List<DropdownMenuItem<String>> generateDropdownItems(List<int> numbers) {
    return numbers.map((number) {
      return DropdownMenuItem(
        child: Text(number.toString()),
        value: number.toString(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = HeightAndColor.height;
    double width = HeightAndColor.width;
    Color woodColor = HeightAndColor.woodColor;
    Color primary = HeightAndColor.primary;
    Color secondary = HeightAndColor.secondary;
    Color third = HeightAndColor.third;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: woodColor,
          width: 2.0,
        ),
        color: secondary,
      ),
      child: Center(
        child: DropdownButton(
          value: selectedValue.toString(),
          items: generateDropdownItems(widget.numbersList),
          dropdownColor: secondary,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          borderRadius: BorderRadius.circular(8.0),
          onChanged: (value) {
            setState(() {
              selectedValue = int.tryParse(value!) ?? 0;
              widget.onValueChanges(selectedValue);
            });
          },
        ),
      ),
    );
  }
}

class MultiplicationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.clear, // Using the "clear" icon for multiplication
      size: 24,
      color: Colors.black, // You can customize the color
      weight: 10,
    );
  }
}

class SpaceBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 5,
    );
  }
}
