import 'package:anwarkabir/basic_widget/division.dart';
import 'package:flutter/material.dart';

class DivisionDistrict extends StatefulWidget {
  @override
  _DivisionDistrictState createState() => _DivisionDistrictState();
}

class _DivisionDistrictState extends State<DivisionDistrict> {
  Division? selectedDivision;
  String? selectedDistrict;

  List<Division> divisions = [
    Division(name: 'Barisal', districts: [
      'Barguna',
      'Barisal',
      'Bhola',
      'Jhalokati',
      'pirojpur',
    ]),
    Division(
      name: 'Dhaka',
      districts: [
        'Dhaka',
        'Faridpur',
        "Gazipur",
        'Gopalganj',
        'Kishoreganj',
        'Madaripur',
        'Manikganj',
        'Munshiganj',
        'Narayanganj',
        'Narsingdi',
        'Rajbari',
        'Shariatpur',
        'Tangail'
      ],
    ),
    Division(name: 'Chittagong', districts: [
      'Bandarban',
      'Brahmanbaria',
      'Chandpur',
      'Chittagong',
      'Comilla',
      "Cox's Bazar",
      'Feni',
      'Khagrachhari',
      'Lakshmipur',
      'Noakhali',
      'Rangamati'
    ]),
    Division(name: 'Khulna', districts: [
      'Bagerhat',
      "Chuadanga",
      'Jessore',
      'Jhenaidah',
      'Khulna',
      'Kushtia',
      'Magura',
      'Meherpur',
      'Narail',
      'Satkhira',
    ]),
    Division(
        name: 'Mymensingh',
        districts: ['Jamalpur', 'Mymensingh', 'Netrokona', 'Sherpur']),
    Division(name: 'Rajshahi', districts: [
      'Bogra',
      'Joypurhat',
      'Naogaon',
      'Natore',
      'Chapai Nawabganj',
      'Pabna',
      'Rajshahi',
      'Sirajganj'
    ]),
    Division(name: 'Rangpur', districts: [
      'Dinajpur',
      'Gaibandha',
      'Kurigram',
      'Lalmonirhat',
      'Nilphamari',
      'Panchagarh',
      'Rangpur',
      'Thakurgaon'
    ]),
    Division(
        name: 'Sylhet',
        districts: ['Habiganj', 'Moulvibazar', 'Sunamganj', 'Sylhet'])
    // Add more divisions and districts as needed
  ];

  // final TextEditingController _divisionController = TextEditingController();
  // final List<String> _divisions = [
  //   'Dhaka',
  //   'Chittagong',
  //   'Rajshahi',
  //   'Khulna',
  //   'Barisal',
  //   'Sylhet',
  //   'Rangpur',
  //   'Mymensingh',
  // ];
  // String? _selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Division & District Selection'),
        ),
        body: Center(
          child: Form(
            child: Column(
              children: [
                Text('Slected Your Division & District'),
                Row(
                  children: [
                    DropdownButton<Division>(
                      value: selectedDivision,
                      onChanged: (division) {
                        setState(() {
                          selectedDivision = division;
                          selectedDistrict =
                              null; // Reset district on division change
                        });
                      },
                      items: divisions.map((division) {
                        return DropdownMenuItem<Division>(
                          value: division,
                          child: Text(division.name),
                        );
                      }).toList(),
                      hint: Text('Select Division'),
                    ),
                    SizedBox(width: 25.0,),
                    if (selectedDivision != null)
                      DropdownButton<String>(
                        value: selectedDistrict,
                        onChanged: (district) {
                          setState(() {
                            selectedDistrict = district;
                          });
                        },
                        items: selectedDivision!.districts.map((district) {
                          return DropdownMenuItem<String>(
                            value: district,
                            child: Text(district),
                          );
                        }).toList(),
                        hint: Text('Select District'),
                      ),
                  ],
                ),
                // Text('Slected Your Division'),
                // DropdownButton<Division>(
                //   value: selectedDivision,
                //   onChanged: (division) {
                //     setState(() {
                //       selectedDivision = division;
                //       selectedDistrict =
                //           null; // Reset district on division change
                //     });
                //   },
                //   items: divisions.map((division) {
                //     return DropdownMenuItem<Division>(
                //       value: division,
                //       child: Text(division.name),
                //     );
                //   }).toList(),
                //   hint: Text('Select Division'),
                // ),
                // if (selectedDivision != null)
                //   DropdownButton<String>(
                //     value: selectedDistrict,
                //     onChanged: (district) {
                //       setState(() {
                //         selectedDistrict = district;
                //       });
                //     },
                //     items: selectedDivision!.districts.map((district) {
                //       return DropdownMenuItem<String>(
                //         value: district,
                //         child: Text(district),
                //       );
                //     }).toList(),
                //     hint: Text('Select District'),
                //   ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedDivision != null && selectedDistrict != null) {
                      // Perform form submission or further actions
                      print('Selected Division: ${selectedDivision!.name}');
                      print('Selected District: $selectedDistrict');
                    }
                  },
                  child: Text('Submit'),
                ),

                // TextFormField(
                //   controller: _divisionController,
                //   decoration: InputDecoration(
                //     labelText: 'Division',
                //   ),
                // ),
                // DropdownButton(
                //   value: _selectedDistrict,
                //   items: _divisions
                //       .map((division) => DropdownMenuItem(
                //           child: Text(division), value: division))
                //       .toList(),
                //   onChanged: (district) {
                //     setState(() {
                //       _selectedDistrict = district;
                //     });
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
