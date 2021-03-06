import 'package:flutter/material.dart';
import 'package:user/widgets/appbar_for_sanitizer_and_parlour_screen.dart';
import '../Models/sanitizer_screen_categories.dart';

class AreaScreen extends StatefulWidget {
  final String uid, vendorName;
  final String pricePerFeet;
  final String location;
  final Category category;

  AreaScreen(
      {@required this.uid,
      @required this.vendorName,
      @required this.pricePerFeet,
      @required this.location,
      @required this.category});

  @override
  _AreaScreenState createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  String areaText;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final pricePerFeet = double.parse(widget.pricePerFeet);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBarForSanitizerAndParlourScreen(context),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: MediaQuery.of(context).size.width / 2.5,
            child: Image.asset(
              'assets/img/rtigger47.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.16,
            top: MediaQuery.of(context).size.height * 0.04,
            child: Text(
              "Sanitizer and Spray",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Color.fromRGBO(00, 44, 64, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    areaText = value;
                  });
                },
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Color.fromRGBO(0, 44, 64, 1)),
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter the Area in Sq.Ft.',
                  hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Color.fromRGBO(0, 44, 64, 1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  //filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: screenWidth * 0.4,
            right: screenWidth * 0.3,
            child: Container(
              height: screenHeight * 0.05,
              child: RaisedButton(
                onPressed: () {
//                  Navigator.of(context)
//                      .push(MaterialPageRoute(builder: (_) => DonePage(7)));
                  //todo : after submit button navigation
                },
                child: Text("Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    )),
                color: Color.fromRGBO(00, 44, 64, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          Positioned(
              top: screenHeight * 0.3,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: Text(
                'Your Total Will Be Rs.' +
                    (areaText == null || areaText.isEmpty
                            ? 0
                            : pricePerFeet * double.tryParse(areaText))
                        .toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
