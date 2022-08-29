import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';
import 'package:opd_app/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:opd_app/main.dart';
import 'package:opd_app/screens/change_language.dart';
import 'package:opd_app/screens/legal_desc/privacy_screen.dart';
import 'package:opd_app/screens/legal_desc/terms_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  static const gray = Color(0xFFB1B1B3);
  static const chefBg = Color(0xFFF0FCCE);
  static const maidSweeperBg = Color(0xFFEBF9FF);
  static const tatkalBg = Color(0xFFA3B5DF);
  static const babySittingBg = Color(0xFFB1CBFF);
  static const elderlyCareBg = Color(0xFFFFE4B9);
  static const scrapBg = Color(0xFFCCEAC7);
  static const laundryBg = Color(0xFFD4E4FF);
  static const fishBg = Color(0xFFFFF1E9);
  static const fruitsBg = Color(0xFFFFE4B9);
  static const actionBtnBg = Color(0xFFD9FFE3);
  static const actionTxtColor = Color(0xFF66656A);

  Future<String?> getMobile() async {
    final prefs = await SharedPreferences.getInstance();
    final mobile = prefs.getString(prefMobile);
    return mobile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(""),
      drawer: buildDrawer(),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            buildPatientCard(),
            buildCategoriesContainer(),
            const SizedBox(height: 17),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(24, 63, 24, 0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AdminDashboard()),
                );
              },
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://source.unsplash.com/random/100x100",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Achal Hingrajiya",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "+91-1234567890",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 42),
            child: Column(
              children: [
                buildDrawerItem(
                  Icons.privacy_tip,
                  "Privacy Policy",
                  const PrivacyScreen(),
                ),
                buildDrawerItem(
                  Icons.event_note,
                  "Terms & conditions",
                  const TermsScreen(),
                ),
                buildDrawerItem(
                  Icons.translate,
                  "Change language",
                  const ChangeLanguageScreen(),
                ),
                buildDrawerItem(
                  Icons.headset_mic,
                  "Support",
                  const AdminDashboard(),
                ),
                buildDrawerItem(
                  Icons.account_balance_wallet,
                  "My Wallet",
                  const AdminDashboard(),
                ),
                buildDrawerItem(
                  Icons.newspaper,
                  "My Invoices",
                  const AdminDashboard(),
                ),
                InkWell(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool(prefLoggedIn, false);
                    print("all set");
                    main();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: gray,
                          size: 24,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Log =out",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildDrawerItem(IconData icon, String itemName, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Icon(
              icon,
              color: gray,
              size: 24,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildTopPicksContainer() {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/dashboard/top_picks.png",
            height: 140,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const Positioned(
            child: Text(
              "Flat 20% OFF",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            top: 11,
            left: 13,
          ),
          const Positioned(
            child: Text(
              "Attract large orders above Rs.299 with an offer",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            top: 51,
            left: 13,
            width: 187,
          ),
          Positioned(
            child: Image.asset(
              "assets/images/dashboard/celebrate.png",
              height: 112,
              width: 150,
              fit: BoxFit.cover,
            ),
            bottom: -5,
            right: 0,
          )
        ],
      ),
    );
  }

  Row buildQuickActionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildQuickActionColumn(
          "assets/images/dashboard/icons/discount.png",
          "Offers",
        ),
        buildQuickActionColumn(
          "assets/images/dashboard/icons/food-delivery.png",
          "Fast Delivery",
        ),
        buildQuickActionColumn(
          "assets/images/dashboard/icons/salad.png",
          "Healthy",
        ),
        buildQuickActionColumn(
          "assets/images/dashboard/icons/smile.png",
          "Pocket Friendly",
        ),
        buildQuickActionColumn(
          "assets/images/dashboard/icons/take-away.png",
          "Take Away",
        )
      ],
    );
  }

  Column buildQuickActionColumn(String imgSrc, String title) {
    return Column(
      children: [
        buildCircularActionBtn(
          actionBtnBg,
          imgSrc,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: actionTxtColor,
          ),
        ),
      ],
    );
  }

  Container buildSubCategoriesContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        mainAxisSpacing: 24,
        crossAxisSpacing: 21,
        children: [
          buildCategoryCard(
            "Fish & Meat",
            fishBg,
            "assets/images/dashboard/dashboard_fish.png",
          ),
          buildComingSoonCategoryCard(
            "Fruits & Vegetables",
            fruitsBg,
            "assets/images/dashboard/dashboard_fruits.png",
          ),
        ],
      ),
    );
  }

  Container buildHeading(String heading) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Text(
        heading,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Container buildCategoriesContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        mainAxisSpacing: 24,
        crossAxisSpacing: 21,
        children: [
          buildCategoryCard(
            "QR Code",
            maidSweeperBg,
            "assets/images/dashboard/dashboard_maid.png",
          ),
          buildComingSoonCategoryCard(
            "Doctors",
            tatkalBg,
            "assets/images/dashboard/dashboard_tatkal.png",
          ),
          buildComingSoonCategoryCard(
            "Departments",
            babySittingBg,
            "assets/images/dashboard/dashboard_baby.png",
          ),

          buildComingSoonCategoryCard(
            "Patients",
            elderlyCareBg,
            "assets/images/dashboard/dashboard_maid.png",
          ),
          buildComingSoonCategoryCard(
            "Announcements",
            scrapBg,
            "assets/images/dashboard/dashboard_maid.png",
          ),
          buildComingSoonCategoryCard(
            "Facilities",
            laundryBg,
            "assets/images/dashboard/dashboard_maid.png",
          ),
          buildComingSoonCategoryCard(
            "About Hospital",
            babySittingBg,
            "assets/images/dashboard/dashboard_baby.png",
          ),

          buildComingSoonCategoryCard(
            "Patients",
            elderlyCareBg,
            "assets/images/dashboard/dashboard_maid.png",
          ),
        ],
      ),
    );
  }


  Container buildComingSoonCategoryCard(
      String catName, Color bgColor, String imgSrc) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: bgColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 11,
            left: 7,
            child: Text(
              catName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Positioned(
            top: 39,
            left: 7,
            child: Text(
              "(Coming soon)",
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            height: 120,
            width: 120,
            bottom: -10,
            right: -10,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(60),
              ),
              child: Image.asset(
                imgSrc,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCategoryCard(String catName, Color bgColor, String imgSrc) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: bgColor,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 11,
            left: 7,
            child: Text(
              catName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 36,
            left: 7,
            child: buildCircularArrowBtn(12, 4, 9, context),
          ),
          Positioned(
            height: 120,
            width: 120,
            bottom: -10,
            right: -10,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(60),
              ),
              child: Image.asset(
                imgSrc,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPatientCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      padding: EdgeInsets.all(
        20,
      ),
      height: 128,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: chefBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, Achal Hingrajiya",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

InkWell buildCircularActionBtn(Color bgColor, String imgSrc) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(24),
    child: Card(
      color: bgColor,
      shape: const CircleBorder(
        side: BorderSide.none,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          imgSrc,
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

InkWell buildCircularArrowBtn(
    double arrowSize,
    double arrowPadding,
    double borderRadius,
    BuildContext context,
    ) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AdminDashboard(),
        ),
      );
    },
    borderRadius: BorderRadius.circular(borderRadius),
    child: Card(
      elevation: 8,
      shape: const CircleBorder(
        side: BorderSide.none,
      ),
      child: Container(
        padding: EdgeInsets.all(arrowPadding),
        child: Icon(
          Icons.arrow_forward,
          size: arrowSize,
          color: Colors.green,
        ),
      ),
    ),
  );
}

AppBar buildAppBar(String title) {
  return AppBar(

    actions: [
      InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            "https://source.unsplash.com/random/50x50",
          ),
          radius: 25,
        ),
      ),
      SizedBox(
        width: 14,
      ),
    ],

    elevation: 0.0,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    backgroundColor: Colors.grey.shade50,
    foregroundColor: Colors.black87,
  );
}
