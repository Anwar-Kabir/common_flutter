import 'package:anwarkabir/akcrud/akcrud_main_model.dart';
import 'package:flutter/material.dart';

class AKCrud extends StatefulWidget {
  const AKCrud({super.key});

  @override
  State<AKCrud> createState() => _AKCrudState();
}

class _AKCrudState extends State<AKCrud> {
  final formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    age.dispose();
  }

  //creating a new empty list to add new user
  List<AkCrudModel> listofdata = [];

  //add new user===>
  void _addUser() {
    if (formkey.currentState!.validate()) {
      // formkey.currentState!.save();
      setState(() {
        listofdata.add(AkCrudModel(
          age: age.text,
          name: name.text,
        ));
      });
      formkey.currentState!.reset();
    }
  }

//update user ====>
  void updateUser(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: listofdata[index].name),
                onChanged: (value) {
                  listofdata[index].name = value;
                },
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: TextEditingController(text: listofdata[index].age),
                onChanged: (value) {
                  listofdata[index].age = value;
                },
                decoration: const InputDecoration(labelText: 'Age'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Text("Name"),
              TextFormField(
                controller: name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Can't be enpty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Age"),
              TextFormField(
                controller: age,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Cant't be Empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Enter Your age"),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    _addUser();
                    print(listofdata.last.name);
                  }
                },
                child: const Text("Create info"),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  shrinkWrap: true,
                  itemCount: listofdata.length,
                  itemBuilder: ((context, index) {
                    var listIndex = listofdata[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.amber,
                        title: Text(listIndex.name),
                        subtitle: Text(listIndex.age),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  updateUser(index);
                                });
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  listofdata.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
