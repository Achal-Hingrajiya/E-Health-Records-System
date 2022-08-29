import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';

class DepartmentsScreen extends StatefulWidget {
  final UserType userType;

  const DepartmentsScreen({Key? key, required UserType this.userType})
      : super(key: key);

  @override
  State<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends State<DepartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey.shade50,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    var searchField = TextFormField(
      maxLines: 1,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 15, top: 20),
        hintText: "Search department",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          borderSide: BorderSide(
            color: gray,
            width: 1,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchField,
              sizedBoxH20W0,
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                        // offset: const Offset(1.0, 1.0),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Department of Anesthesiology",
                        style: black14w600,
                      ),
                      sizedBoxH8W0,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "No of Doctors",
                                style: black12w400,
                              ),
                              sizedBoxH3W0,
                              Text(
                                "No of Patients",
                                style: black12w400,
                              )
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "10",
                                style: black12w400,
                              ),
                              sizedBoxH3W0,
                              Text(
                                "20",
                                style: black12w400,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
