import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoseapp/consts/importer.dart';
import 'package:hoseapp/controllers/home_controller.dart';
import 'package:hoseapp/services/store_services.dart';
import 'package:image_picker/image_picker.dart';

class AddYourCarScreen extends StatefulWidget {
  @override
  _AddYourCarScreenState createState() => _AddYourCarScreenState();
}

class _AddYourCarScreenState extends State<AddYourCarScreen> {
  final controller = Get.find<HomeController>();

  var colorController = TextEditingController();
  var digitController = TextEditingController();
  var alphabetController = TextEditingController();
  var selectedCarIndex;
  var carType = '';
  var selectedIconIndex;
  var carCategory;
  var cartypesList = [
    'assets/bike.png',
    'assets/jeep_ic.png',
    'assets/car.png',
  ];
  var carTypesTitle = ['دراجة نارية', 'سيارات الدفع الرباعي', "سيارات سيدان"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/background_ic.png"), fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/backarrow.png')),
                  Text('اضف مركبتك', textAlign: TextAlign.right, style: TextStyle(fontSize: 16, color: Color(0xff28476E))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 5, left: 5, bottom: 120, top: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text('نوع السيارة', textAlign: TextAlign.right, style: TextStyle(fontSize: 16, color: Color(0xff28476E))),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cartypesList.mapIndexed((car, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCarIndex = index;
                            switch (index) {
                              case 0:
                                carType = 'bike';
                                break;
                              case 1:
                                carType = 'bigCar';
                                break;
                              case 2:
                                carType = 'smallCar';
                                break;
                              default:
                            }
                          });
                        },
                        child: Column(
                          children: [
                            carTypesTitle[index].text.color(Color(selectedCarIndex != null && selectedCarIndex == index ? 0xffffffff : 0xff000000)).make(),
                            Image.asset(
                              car,
                              width: 60,
                            )
                          ],
                        )
                            .box
                            .shadow
                            .padding(EdgeInsets.all(4.0))
                            .margin(EdgeInsets.symmetric(horizontal: 4.0))
                            .size(100, 100)
                            .roundedSM
                            .color(selectedCarIndex != null && selectedCarIndex == index ? Colors.cyan.withOpacity(0.5) : Colors.white)
                            .make(),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: selectedCarIndex == 0 ? false : true,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        'ماركة وموديل السيارة',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16, color: Color(0xff28476E)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: selectedCarIndex == 0 ? false : true,
                    child: SizedBox(
                      height: 56,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: controller.catList.mapIndexed((cat, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIconIndex = index;
                                carCategory = cat.toString();
                                controller.createMiniCategory(context, cat);
                              });
                            },
                            child: Image.asset(
                              'assets/car_logos/' + controller.catList[index] + '.png',
                              width: 32,
                            )
                                .box
                                .margin(EdgeInsets.symmetric(horizontal: 4.0))
                                .color(selectedIconIndex != null && selectedIconIndex == index ? Colors.cyan : Colors.white)
                                .padding(EdgeInsets.all(8.0))
                                .roundedSM
                                .make(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedCarIndex == 0 ? false : true,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: controller.minicat.toString(),
                          icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Vx.gray400),
                          items: controller.minicategories.length == 1
                              ? null
                              : controller.minicategories.map((city) {
                                  return DropdownMenuItem(
                                    child: city.text.make(),
                                    value: city.toString(),
                                  );
                                }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              controller.minicat = newValue.toString();
                            });
                          },
                          hint: controller.minicat.text.make(),
                          isExpanded: true,
                        ),
                      ),
                    ).box.padding(EdgeInsets.all(8.0)).make().card.shadowColor(Colors.cyan.withOpacity(0.5)).roundedSM.make(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Image.asset('assets/handle.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'لون السيارة',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 16, color: Color(0xff28476E)),
                    ),
                  ]),
                  Card(
                    elevation: 3.0,
                    shadowColor: Colors.cyan,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      controller: colorController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(hintText: "لون السيارة", border: OutlineInputBorder()),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(children: [
                          Text('رقم اللوحة',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 11,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            elevation: 5,
                            shadowColor: Color(0xff35DDDE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 80,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 80,
                                      child: TextField(
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        controller: alphabetController,
                                        decoration: InputDecoration(hintText: "مثال:ا ب ت ", hintTextDirection: TextDirection.rtl, border: InputBorder.none),
                                      )),
                                  VerticalDivider(
                                    color: Color(0xff35DDDE),
                                  ),
                                  SizedBox(
                                      width: 80,
                                      child: TextField(
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        controller: digitController,
                                        decoration: InputDecoration(hintText: "مثال:12345", hintTextDirection: TextDirection.rtl, border: InputBorder.none),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                      controller.image == null
                          ? Card(
                              elevation: 8,
                              shadowColor: Color(0xff35DDDE),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Text("صورة السيارة",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 9,
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          // controller.pickImage(setState: setState, context: context);
                                          showDialog(
                                              context: context,
                                              builder: (context) => Dialog(
                                                    child: Container(
                                                        height: 200,
                                                        width: double.infinity,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            ElevatedButton.icon(
                                                              style: ElevatedButton.styleFrom(
                                                                primary: Color(0xff28476E),
                                                              ),
                                                              onPressed: () {
                                                                controller.pickImage(context: context, setState: setState, source: ImageSource.camera);
                                                              },
                                                              label: "Pick from camera".text.make(),
                                                              icon: Icon(Icons.camera_alt_rounded),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            ElevatedButton.icon(
                                                              style: ElevatedButton.styleFrom(
                                                                primary: Color(0xff28476E),
                                                              ),
                                                              onPressed: () {
                                                                controller.pickImage(context: context, setState: setState, source: ImageSource.gallery);
                                                              },
                                                              label: "Pick from gallery".text.make(),
                                                              icon: Icon(Icons.photo),
                                                            ),
                                                          ],
                                                        )),
                                                  ));
                                        },
                                        child: Image.asset('assets/gallery.png')),
                                  ],
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          child: Container(
                                              height: 200,
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton.icon(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color(0xff28476E),
                                                    ),
                                                    onPressed: () {
                                                      controller.pickImage(context: context, setState: setState, source: ImageSource.camera);
                                                    },
                                                    label: "Pick from camera".text.make(),
                                                    icon: Icon(Icons.camera_alt_rounded),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton.icon(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color(0xff28476E),
                                                    ),
                                                    onPressed: () {
                                                      controller.pickImage(context: context, setState: setState, source: ImageSource.gallery);
                                                    },
                                                    label: "Pick from gallery".text.make(),
                                                    icon: Icon(Icons.photo),
                                                  ),
                                                ],
                                              )),
                                        ));
                                // controller.pickImage(setState: setState, context: context, source: ImageS);
                              },
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    controller.image!,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (carType.isNotEmpty && colorController.text.isNotEmpty && controller.image != null) {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "جاري إضافة المركبة",
                                            style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                ));
                        await StoreServices.uploadImage(controller.image);
                        await StoreServices.storeCar(
                            color: colorController.text,
                            category: selectedCarIndex == 0 ? '' : carCategory,
                            subcategory: selectedCarIndex == 0 ? '' : controller.minicat,
                            carType: carType,
                            imageUrl: StoreServices.imageLink,
                            alphabets: alphabetController.text,
                            digits: digitController.text);
                        VxToast.show(context, msg: "Car added");
                        controller.image = null;
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 45,
                      child: Text(
                        "استمرار",
                        style: TextStyle(color: Colors.white),
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
}
