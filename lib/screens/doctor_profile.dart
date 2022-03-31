import 'package:flutter/material.dart';
import 'package:opd_app/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const profileBg = Color(0xFFF5F5F5);
  static const gray = Color(0xFF979797);
  static const blue = Color(0xFF005F8F);
  static const borderGray = Color(0xFF9A9DA7);
  static const reviewDayGray = Color(0xFFB1B1B3);
  static const starYellow = Color(0xFFFFC107);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20,
        ),
      ),
      title: const Text(
        "Profile",
        style: black19w400,
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                buildProfileContainer(context),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildRateWorkContainer("Patients served", "600"),
                    buildRateWorkContainer("Completed", "55 surgeries"),
                  ],
                ),
                const SizedBox(height: 24),
                buildDescriptionContainer(),
                const SizedBox(height: 20),
                buildReviewContainer(),
                const SizedBox(height: 22),
                InkWell(
                  onTap: () {
                    print("pressed");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.remove_red_eye,
                        size: 12,
                        color: gray,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "7 More Reviews",
                        style: TextStyle(
                          color: gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const Divider(thickness: 2),
                ),
              ],
            ),
          ),
          buildPositionedButton(),
        ],
      ),
    );
  }

  Positioned buildPositionedButton() {
    return Positioned(
      bottom: 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          fixedSize: const Size(331.0, 45.0),
          primary: blue,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        onPressed: () {},
        child: const Text("Book Now"),
      ),
    );
  }

  Container buildReviewContainer() {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Reviews",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/100x100"),
                      radius: 18,
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ankit Joshi",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        buildStarRow(3),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "1 day ago",
                  style: TextStyle(
                    fontSize: 10,
                    color: reviewDayGray,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Row buildStarRow(int d) {
    var list = List<int>.generate(d, (i) => i + 1);
    var list2 = List<int>.generate(5 - d, (i) => i + 1);
    var stars = <Widget>[];
    for (var i in list) {
      stars.add(
        const Icon(
          Icons.star,
          color: starYellow,
          size: 10,
        ),
      );
    }

    for (var i in list2) {
      stars.add(
        const Icon(
          Icons.star_border,
          color: starYellow,
          size: 10,
        ),
      );
    }

    stars.add(
      const SizedBox(width: 5),
    );
    stars.add(
      Text(
        d.toDouble().toString(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    return Row(children: stars);
  }

  Container buildProfileContainer(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: profileBg,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CircleAvatar(
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random/200x200"),
            radius: 45,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Dr. Kenit Patel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          buildLocationRow(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildRatingReviewAge("72", "Rating"),
              buildRatingReviewAge("65", "Reviews"),
              buildRatingReviewAge("38", "Years old"),
            ],
          ),
        ],
      ),
    );
  }

  Container buildDescriptionContainer() {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "Description",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet. The characters are spread out evenly so that the reader's attention is focused on the layout of the text instead of its content.The lorem ipsum is a placeholder text used in publishing and graphic design. This filler text is a short paragraph that contains all the letters of the alphabet.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Container buildRateWorkContainer(String fieldName, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderGray,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              color: blue,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Row buildLocationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.school,
          size: 12,
          color: gray,
        ),
        sizedBoxH0W12,
        Text(
          "MBBS",
          style: TextStyle(
            color: gray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.circle,
          color: gray,
          size: 5,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "7 Year Experience",
          style: TextStyle(
            color: gray,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Column buildRatingReviewAge(String count, String fieldName) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          fieldName,
          style: const TextStyle(
            color: gray,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
