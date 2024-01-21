import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'constant.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

enum textStyleLabels {
  openSans('openSans', GoogleFonts.openSans),
  oswald('oswald', GoogleFonts.oswald),
  nunito('nunito', GoogleFonts.nunito),
  merriweather('merriweather', GoogleFonts.merriweather),
  poppins('poppins', GoogleFonts.poppins),
  ubuntu('ubuntu', GoogleFonts.ubuntu),
  grapeNuts('grapeNuts', GoogleFonts.grapeNuts),
  aclonica('aclonica', GoogleFonts.aclonica),
  roboto('roboto', GoogleFonts.roboto);

  const textStyleLabels(this.label, this.style);
  final String label;
  final style;
}

enum textStyleSize {
  small('small', FontWeight.w200, 11),
  Normal('Normal', FontWeight.w400, 14),
  Large('Large', FontWeight.w600, 18),
  Huge('Huge', FontWeight.w900, 25);

  const textStyleSize(this.label, this.weight, this.size);
  final String label;
  final FontWeight weight;
  final double size;
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: 11, vsync: this);
  }

  var dragstart = Padding(
      padding: EdgeInsets.all(
        5,
      ),
      child: Icon(
        Icons.star,
        color: Colors.pink,
        size: 20,
      ));
  List inUseStar = [
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.orange,
          size: 20,
        )),
  ];
  List notUseStar = [
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.red,
          size: 20,
        )),
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.cyan,
          size: 20,
        )),
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        )),
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.green,
          size: 20,
        )),
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.purple,
          size: 20,
        )),
    const Padding(
        padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0,
        ),
        child: Icon(
          Icons.star,
          color: Colors.blue,
          size: 20,
        )),
  ];
  String selectedValue = 'Option 1';
  List<String> lanuages = [
    'Afrikaans',
    'Albanian',
    'Arabic',
    'Basque',
    'Cambodian',
    'English (UK)',
    'English (US)',
    'Estonian',
    'Fiji',
    'Italian',
    'Japanese',
    'German',
    'Gujarati',
    'Hindi',
    'Indonesian',
    'Javanese',
    'Urdu',
    'Welsh'
  ];
  List<String> country = [
    'Afghanistan',
    'Algeria',
    'Angola',
    'Azerbaijan',
    'Bangladesh',
    'Bhutan',
    'Canada',
    'Colombia',
    'Fiji',
    'Germany',
    'India',
    'Iran',
    'Kenya',
    'Malta',
    'Mexico',
    'Netherlands',
    'Pakistan',
    'Russia'
  ];
  textStyleLabels selectetextStyle = textStyleLabels.openSans;
  textStyleSize selectedsize = textStyleSize.Normal;
  var selectedCountry = 'India';
  var selectedLanguage = 'English (UK)';
  List<String> signatures = [];
  Color selectedColor = Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var _scrollController;
    List<String> dropdownItems = [
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4'
    ];

    Widget language() {
      return Expanded(
          child: SingleChildScrollView(
        child: Container(
          height: height * 0.2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.18,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Language:',
                  style: kSectionTitleText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                // width: width * 0.5,
                child: Row(
                  children: [
                    Text(
                      'Gmail display language: ',
                      style: kSectionTitleText.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 270,
                      height: 23,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(1.0)),
                          contentPadding: const EdgeInsets.all(2),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              isDense: true,
                              style: TextStyle(fontSize: 13),
                              // isExpanded: true,
                              menuMaxHeight: 350,
                              value: selectedLanguage,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedLanguage = newValue ?? 'English';
                                });
                              },
                              items: [
                                const DropdownMenuItem(
                                  value: "",
                                  child: Text(
                                    "Select Here",
                                  ),
                                ),
                                ...lanuages.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }

    Widget PhoneNumbers() {
      return Expanded(
          child: SingleChildScrollView(
              child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: width * 0.18,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Phone numbers:',
                  style: kSectionTitleText.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
            Container(
              // width: width * 0.5,
              child: Row(
                children: [
                  Text(
                    'Default country code: ',
                    style: kSectionTitleText.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: 270,
                    height: 23,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(1.0)),
                        contentPadding: const EdgeInsets.all(2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isDense: true,
                            style: TextStyle(fontSize: 13),
                            // isExpanded: true,
                            menuMaxHeight: 350,
                            value: selectedCountry,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountry = newValue ?? 'English';
                              });
                            },
                            items: [
                              const DropdownMenuItem(
                                value: "",
                                child: Text(
                                  "Select Here",
                                ),
                              ),
                              ...country.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )));
    }

    final TextEditingController fontController = TextEditingController();
    final TextEditingController sizeController = TextEditingController();
    Widget DefaultTextStyle() {
      return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: width * 0.18,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Default text style:',
                      style: kSectionTitleText.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        '(Use the \'Remove formatting\' button on the toolbar to reset the default text style))',
                        style: kSectionTitleText.copyWith(
                          // color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              // width: width * 0.5,
              height: 130,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: DropdownButtonHideUnderline(
                              child: DropdownMenu<textStyleLabels>(
                                inputDecorationTheme: InputDecorationTheme(
                                  border: null,
                                ),
                                initialSelection: textStyleLabels.openSans,
                                controller: fontController,
                                requestFocusOnTap: true,
                                // label: Text('Font'),
                                onSelected: (textStyleLabels? newValue) {
                                  setState(() {
                                    selectetextStyle =
                                        newValue ?? textStyleLabels.openSans;
                                  });
                                },
                                dropdownMenuEntries: textStyleLabels.values
                                    .map<DropdownMenuEntry<textStyleLabels>>(
                                        (textStyleLabels currValue) {
                                  return DropdownMenuEntry<textStyleLabels>(
                                    value: currValue,
                                    label: currValue.label,
                                    enabled: currValue.label != 'Grey',
                                    style: MenuItemButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      textStyle: currValue.style().copyWith(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: DropdownButtonHideUnderline(
                              child: DropdownMenu<textStyleSize>(
                                inputDecorationTheme: InputDecorationTheme(
                                  border: null,
                                ),
                                initialSelection: textStyleSize.Normal,
                                controller: sizeController,
                                requestFocusOnTap: true,
                                // label: Text('Font'),
                                onSelected: (textStyleSize? newValue) {
                                  setState(() {
                                    selectedsize =
                                        newValue ?? textStyleSize.Normal;
                                  });
                                },
                                dropdownMenuEntries: textStyleSize.values
                                    .map<DropdownMenuEntry<textStyleSize>>(
                                        (textStyleSize currentValue) {
                                  return DropdownMenuEntry<textStyleSize>(
                                    value: currentValue,
                                    label: currentValue.label,
                                    enabled: currentValue.label != 'Grey',
                                    style: MenuItemButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      textStyle: GoogleFonts.openSans()
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: currentValue.size,
                                              fontWeight: currentValue.weight),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: IconButton(
                              icon: Icon(Icons.color_lens),
                              onPressed: () {
                                showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Container(
                                        height: 300,
                                        width: 300,
                                        color: Colors.white,
                                        child: BlockPicker(
                                          pickerColor:
                                              Colors.red, //default color
                                          onColorChanged: (Color color) {
                                            //on the color picked
                                            setState(() {
                                              selectedColor = color;
                                              Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedColor = Color.fromARGB(255, 0, 0, 0);
                                  selectedsize = textStyleSize.Normal;
                                  selectetextStyle = textStyleLabels.openSans;
                                });
                              },
                              icon: Icon(Icons.reset_tv))
                        ],
                      ),
                      Text(
                        'This is what your body text will look like.',
                        style: selectetextStyle.style().copyWith(
                              color: selectedColor,
                              fontSize: selectedsize.size,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget dragableStar(var icon, var index) {
      return Draggable(
        data: icon,
        child: dragstart == icon ? Container() : icon,
        feedback: icon,
        childWhenDragging: null,
        onDragStarted: () {
          setState(() {
            dragstart = icon;
          });
        },
        onDragCompleted: () {
          setState(() {
            dragstart = Padding(
                padding: EdgeInsets.all(
                  5,
                ),
                child: Icon(
                  Icons.star,
                  color: Colors.pink,
                  size: 20,
                ));
          });
        },
      );
    }

    void star1() {
      if (inUseStar.length == 1) {
        return;
      } else if (inUseStar.length > 1) {
        int size = inUseStar.length;
        for (int i = 0; i < size - 1; i++) {
          setState(() {
            var ic = inUseStar[i];
            notUseStar.add(ic);
            inUseStar.remove(ic);
          });
        }
      } else {
        setState(() {
          var ic = notUseStar[0];
          notUseStar.remove(ic);
          inUseStar.add(ic);
        });
      }
    }

    void star2() {
      if (inUseStar.length == 4) {
        return;
      } else if (inUseStar.length > 4) {
        int size = inUseStar.length;
        for (int i = 0; i < size - 4; i++) {
          setState(() {
            var ic = inUseStar[i];
            notUseStar.add(ic);
            inUseStar.remove(ic);
          });
        }
      } else {
        for (int i = 0; i < 4; i++) {
          setState(() {
            var ic = notUseStar[i];
            notUseStar.remove(ic);
            inUseStar.add(ic);
          });
        }
      }
    }

    void allstar() {
      if (inUseStar.length == 7) {
        return;
      } else {
        int size = notUseStar.length;
        for (int i = 0; i < size; i++) {
          setState(() {
            var ic = notUseStar[i];
            notUseStar.remove(ic);
            inUseStar.add(ic);
          });
        }
      }
    }

    Widget Stars() {
      var text = RichText(
        text: TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Drag the stars between the lists.',
              style: kSectionTitleText.copyWith(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            TextSpan(
                text:
                    ' The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                style: TextStyle()),
          ],
        ),
      );
      return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.18,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Stars:',
                style: kSectionTitleText.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(

                // width: width * 0.5,
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: width * 0.5, child: text),
                    Row(
                      children: [
                        Text('Present : '),
                        TextButton(
                            onPressed: star1,
                            child: Text(
                              '1 star',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            )),
                        TextButton(
                            onPressed: star2,
                            child: Text(
                              '4 star',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            )),
                        TextButton(
                            onPressed: allstar,
                            child: Text(
                              'all star',
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'in Use:',
                          style: kSectionTitleText.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        DragTarget(
                          onAccept: (data) {
                            setState(() {
                              notUseStar.remove(data);
                              if (!inUseStar.contains(data))
                                inUseStar.add(data);
                            });
                          },
                          builder: (context, candidateData, rejectedData) =>
                              Container(
                            height: 35,
                            width: width * 0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  dragableStar(inUseStar[index], index),
                              itemCount: inUseStar.length,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'not in use:',
                          style: kSectionTitleText.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        DragTarget(
                          onAccept: (data) {
                            setState(() {
                              inUseStar.remove(data);
                              if (!notUseStar.contains(data))
                                notUseStar.add(data);
                            });
                          },
                          builder: (context, candidateData, rejectedData) =>
                              Container(
                            height: 35,
                            width: width * 0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  dragableStar(notUseStar[index], index),
                              itemCount: notUseStar.length,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      );
    }

    TextEditingController _textFieldController = TextEditingController();

    Future<void> _displayTextInputDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            backgroundColor: Colors.white,
            title: Text('Name New Signature'),
            content: Container(
              width: 400,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 1, style: BorderStyle.solid)),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: "Signature name",
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                child: Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                child: Text('Create', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print(_textFieldController.text);
                  setState(() {
                    signatures.add(_textFieldController.text);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    Widget Signature() {
      return SizedBox(
        width: width * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: width * 0.18,
                height: 500,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Signature:',
                      style: kSectionTitleText.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        '(appended at the end of all outgoing messages)',
                        style: kSectionTitleText.copyWith(
                          // color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Learn more',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )),
            Container(
                width: width * 0.5,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    signatures.length == 0
                        ? Text(
                            'No Signature:',
                            style: kSectionTitleText.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        : SizedBox(
                            width: width * 0.6,
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black26)),
                                height: 200,
                                width: 200,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      height: 40,
                                      color: Color.fromARGB(255, 202, 213, 229),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            child: Text(signatures[index],
                                                style: TextStyle(),
                                                overflow: TextOverflow.fade),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.edit)),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  signatures.remove(
                                                      signatures[index]);
                                                });
                                              },
                                              icon: Icon(Icons.delete))
                                        ],
                                      ),
                                    ),
                                    Container()
                                  ],
                                ),
                              ),
                              itemCount: signatures.length,
                            ),
                          ),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 1),
                        onPressed: () {
                          _displayTextInputDialog();
                        },
                        icon: Icon(Icons.add, color: Colors.blueAccent),
                        label: Text(
                          'Create new',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Row(
            children: [
              Icon(
                Icons.email,
                color: Colors.red,
              ),
              Text('Gmail'),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.help_outline_outlined,
                    color: Colors.white, size: 28)),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.dashboard_outlined,
                  color: Colors.white,
                  size: 28,
                ))
          ],
        ),
        drawer: Drawer(
          width: width * 0.7,
        ),
        body: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/imag/backii.jpg"),
          //         fit: BoxFit.cover)),
          height: height * 0.9,
          width: width,
          // color: Colors.transparent,
          child: Row(
            children: [
              Container(
                width: width * 0.2,
                height: height,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.tag,
                                  color: Colors.black,
                                ),
                              ),
                              label: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Inbox',
                                  style: TextStyle(color: Colors.black),
                                ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.inbox,
                              color: Colors.black,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Inbox',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.star_border_outlined,
                              color: Colors.black,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Stared',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.history,
                              color: Colors.black,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Snoozed',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'sent',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.drafts,
                              color: Colors.black,
                            ),
                          ),
                          label: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Draft',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                width: width * 0.77,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(87, 160, 161, 162),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      padding: EdgeInsets.fromLTRB(15, 5, 5, 0),
                      child: const Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    TabBar(
                      controller: _controller,
                      isScrollable: true,
                      labelStyle: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'Manrope',
                          fontSize: height * 0.019,
                          fontWeight: FontWeight.w800),
                      labelColor: Colors.blueAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 4.0, color: Colors.blueAccent),
                          insets: EdgeInsets.symmetric(horizontal: 1.0)),
                      tabs: const [
                        Tab(
                          text: 'General',
                        ),
                        Tab(
                          text: 'Labels',
                        ),
                        Tab(
                          text: 'Inbox',
                        ),
                        Tab(
                          text: 'Accounts and Imports',
                        ),
                        Tab(
                          text: 'Filters and Blocked adddresses',
                        ),
                        Tab(
                          text: 'Forwarding and POP?IMPA',
                        ),
                        Tab(
                          text: 'Add-ons',
                        ),
                        Tab(
                          text: 'Chat and Meet',
                        ),
                        Tab(
                          text: 'Advanced',
                        ),
                        Tab(
                          text: 'Offline',
                        ),
                        Tab(
                          text: 'Theme',
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                      height: 0,
                    ),
                    Container(
                      height: 100,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        children: <Widget>[Container(child: language())],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 50,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        children: <Widget>[Container(child: PhoneNumbers())],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 140000 / width,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        children: <Widget>[
                          Container(child: DefaultTextStyle())
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 200,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        children: <Widget>[Container(child: Stars())],
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 400,
                      width: width * 0.8,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _controller,
                        children: <Widget>[
                          Container(
                              height: 400,
                              width: width * 0.8,
                              child: Signature())
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
