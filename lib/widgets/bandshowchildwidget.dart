import 'package:down_beat/utils/comman.dart';
import 'package:down_beat/utils/txt.dart';
import 'package:flutter/material.dart';
import 'package:down_beat/utils/img.dart';

class BandShowChild extends StatefulWidget {
  var showData;

  BandShowChild({Key key, this.showData});

  @override
  _BandShowChildState createState() => _BandShowChildState();
}

class _BandShowChildState extends State<BandShowChild> {
  List<int> _dropdownItems = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  List<DropdownMenuItem<int>> _dropdownMenuItems;
  final FocusNode _firstInput = new FocusNode();
  final FocusNode _secondInput = new FocusNode();
  final FocusNode _thirdInput = new FocusNode();
  final FocusNode _fourthInput = new FocusNode();

  int _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<int>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<int>> items = List();
    for (int listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.toString()),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: LayoutBuilder(builder: (context, constrains) {
          return GestureDetector(
            onTap: () {
              _byNowSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.showData['title'] != null
                            ? widget.showData['title']
                            : '',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17.0),
                      ),
                      Text(
                        "\$ ${widget.showData['amount'].toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.purple[700],
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.showData['location'] != null
                            ? widget.showData['location']
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500],
                            fontSize: 14.0),
                      ),
                      Text(
                        widget.showData['buy_text'] != null
                            ? widget.showData['buy_text']
                            : '',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }


  // Details Bottom Sheet
  _byNowSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Image.asset(
                          Img.x_image,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {}),
                  ),
                  Text(
                    Txt.choose_products_text,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Comman.sizeBoxheight(30.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.vip_entry_text,
                              style: TextStyle(
                                color: Colors.black,
                                  fontSize: 19.0, fontWeight: FontWeight.w600),
                            ),
                            Comman.sizeBoxheight(10.0),
                            Text(
                              Txt.vip_general_inner_text,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '\$50',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                            ),
                            Comman.sizeBoxwidth(20.0),
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              width: MediaQuery.of(context).size.width * 0.15,
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              color: Colors.grey,
                              child: DropdownButton<int>(
                                value: _selectedItem,
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItem = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                  ),
                  Comman.sizeBoxheight(20.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Txt.general_addmis_text,
                              style: TextStyle(
                                color: Colors.black,
                                  fontSize: 19.0, fontWeight: FontWeight.w600),
                            ),
                            Comman.sizeBoxheight(10.0),
                            Text(
                              Txt.vip_general_inner_text,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '\$30',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                            ),
                            Comman.sizeBoxwidth(20.0),
                            Container(
                              padding: const EdgeInsets.only(left: 8.0),
                              width: MediaQuery.of(context).size.width * 0.15,
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              color: Colors.grey,
                              child: DropdownButton<int>(
                                value: _selectedItem,
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItem = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Divider(
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  color: Color.fromRGBO(68, 215, 182, 1),
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  onPressed: () {
                    _confirmpaymentSheet(context);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  // Details Bottom Sheet
  _confirmpaymentSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Image.asset(
                          Img.x_image,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {}),
                  ),
                  _confirmPayment(),
                  Comman.sizeBoxheight(20.0),
                  Column(
                    children: [
                      Column(
                        children: [
                          Comman.sizeBoxheight(15.0),
                          _card(),
                          Comman.sizeBoxheight(25.0),
                          _inputName(),
                          Comman.sizeBoxheight(10.0),
                          _inputCardNum(),
                          Comman.sizeBoxheight(10.0),
                          _inputdataCVV(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  color: Color.fromRGBO(68, 215, 182, 1),
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  onPressed: () {
                    _orderSummarySheet(context);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],);
        });
  }

  // Confirm Payement
  _confirmPayment(){
    return Text(
      Txt.cobfirm_payment_text,
      style: TextStyle(color: Colors.black,fontSize: 20.0,
      fontWeight: FontWeight.w600
      ),
    );
  }

  // Choose Card Issuer
  _card() {
    return Column(
      children: [
        Text(Txt.choose_card_text,style: TextStyle(
            fontSize: 18.0,
            color: Colors.black),),
        Comman.sizeBoxheight(10.0),
        Container(
          width:  MediaQuery.of(context).size.width*0.80,
          height:  MediaQuery.of(context).size.height*0.050,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Img.visa_card_image),
              Image.asset(Img.diner_card_image),
              Image.asset(Img.american_express_image),
              Image.asset(Img.discover_image),
              Image.asset(Img.mastercard_image),
            ],
          ),
        ),
      ],
    );
  }

  // Input Name
  _inputName() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      height:  MediaQuery.of(context).size.height*0.050,
      child: TextField(
        cursorColor: Colors.black,
        focusNode: _firstInput,
        textInputAction: TextInputAction.next,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_secondInput),
        autocorrect: true,
        style: TextStyle(color: Colors.black,fontSize: 18.0),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
            filled: true,
            contentPadding: const EdgeInsets.all(8),
            hintText: 'name',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 18.0,
            ),
            border: InputBorder.none),
      ),
    );
  }

  // Input Name
  _inputCardNum() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      height:  MediaQuery.of(context).size.height*0.050,
      child: TextField(
        cursorColor: Colors.black,
        focusNode: _secondInput,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_thirdInput),
        autocorrect: true,
        style: TextStyle(color: Colors.black, fontSize: 18.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
            filled: true,
            contentPadding: const EdgeInsets.all(8),
            hintText: 'card number',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 18.0,
            ),
            border: InputBorder.none),
      ),
    );
  }

  // Month and Year with CVV
  _inputdataCVV() {
    return Container(
      height:  MediaQuery.of(context).size.height*0.050,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              focusNode: _thirdInput,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(_fourthInput),
              style: TextStyle(color: Colors.black,fontSize: 18.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'month/year',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                  ),
                  border: InputBorder.none),
            ),
          ),
          Comman.sizeBoxwidth(15.0),
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              focusNode: _fourthInput,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              autocorrect: true,
              style: TextStyle(color: Colors.black,fontSize: 18.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: Color.fromRGBO(90, 90, 90, 0.10).withOpacity(0.20),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'CVV',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18.0,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  // Details Bottom Sheet
  _orderSummarySheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        icon: Image.asset(
                          Img.x_image,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {}),
                  ),
                  Text(
                    Txt.order_sum_text,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: Colors.black
                    ),
                  ),
                  Comman.sizeBoxheight(20.0),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Txt.vip_qty_text,
                          style: TextStyle(fontSize: 19.0),
                        ),
                        Text(
                          '\$100',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                              color: Colors.green[400],
                              fontSize: 19.0),
                        ),
                        Comman.sizeBoxheight(15.0),
                        Text(
                          Txt.general_qty_text,
                          style: TextStyle(fontSize: 19.0),
                        ),
                        Text(
                          '\$60',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green[400],
                              fontSize: 19.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Divider(
                      color: Colors.black,
                      thickness: 0.3,
                    ),
                  ),
                  Comman.sizeBoxheight(10.0),
                  Text(
                    Txt.total_text,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                  Text(
                    '\$160',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green[400],
                        fontSize: 20.0),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  color: Color.fromRGBO(68, 215, 182, 1),
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  onPressed: () {},
                  child: Text(
                    Txt.complete_tex,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }


}
