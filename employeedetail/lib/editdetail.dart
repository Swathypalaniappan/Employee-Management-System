import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:employeedetail/firestore.dart';

class EditDetail extends StatefulWidget {
  final String value;
  EditDetail({Key key, this.value}) : super(key: key);

  _EditDetailState createState() => _EditDetailState();
}

class _EditDetailState extends State<EditDetail> {
  String no = '', name = '', email = '';
  final TextEditingController _noController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _idController.dispose();
    _noController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Add Employee Detail"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Container(
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Employee Name",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2)),
                    ),
                    onSaved: (val) {
                      this.name = _nameController.text;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email ID",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                      ),
                      onSaved: (val) {
                        this.email = _emailController.text;
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _noController,
                    decoration: InputDecoration(
                      labelText: "Contact Number",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2)),
                    ),
                    onSaved: (val) {
                      this.no = _noController.text;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton.icon(
                      onPressed: () {
                        final EntryMap = Entry(
                                name: _nameController.text,
                                id: widget.value,
                                email: _emailController.text,
                                no: _noController.text)
                            .toMap();
                        FirebaseFirestore.instance
                            .collection('employee')
                            .doc(widget.value)
                            .update(EntryMap);
                        setState(() {
                          _nameController.clear();
                          _emailController.clear();
                          _noController.clear();
                        });
                      },
                      label: Text("Update",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          )),
                      icon: Icon(Icons.add_circle_outline_outlined),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.blue[800]),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
