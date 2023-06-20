import 'package:flutter/material.dart';

Image appLogo = const Image(
  image: ExactAssetImage("images/logo.jpg"),
  height: 75.0,
  width: 75.0,
);

List categoryList = [
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Aluminum.png",
    "name": "Aluminum containers",
    "description": [
      "Rinse or wipe clean all food or other residue.",
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Balloons.png",
    "name": "Balloons",
    "description": ["Put this item in your trash bin."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Batteries.png",
    "name": "Batteries",
    "description": [
      "Lithium Batteries: Hold for a local household hazardous waste collection day.",
      "Call your local Recycling Center or City/Town Hall for more information."
    ]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/BerryBaskets.png",
    "name": "Berry baskets",
    "description": ["Put this item in your trash bin."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Boxes.png",
    "name": "Boxes",
    "description": ["Put this item in your trash bin."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Cans.png",
    "name": "Cans",
    "description": ["Empty and rinse."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Cardboard.png",
    "name": "Cardboard",
    "description": [
      "Flatten/nest when possible. Remove all foam, bubble wrap, air pillows.",
      "Remove as much tape as you can but, generally speaking, tape is okay."
    ]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Chopsticks.png",
    "name": "Chopsticks",
    "description": ["Put this item in your trash bin."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/FoodBox.png",
    "name": "Food boxes",
    "description": ["Remove all liners."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/FoodCans.png",
    "name": "Food cans",
    "description": ["Rinse or wipe clean all food/residue. Replace lid."]
  },
  {
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/GlassBottle.png",
    "name": "Glass bottle",
    "description": ["Rinse or wipe clean all food/residue."]
  },
  {
    "name": "Jars (glass and plastic)",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Jars.png",
    "description": [
      "Rinse or wipe clean all food/residue. Replace lid.",
      "There is NO need to remove label."
    ]
  },
  {
    "name": "Jugs",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Jug.png",
    "description": ["Rinse or wipe clean all food/residue. Replace lid."]
  },
  {
    "name": "Mail",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Mail.png",
    "description": ["Remove free samples."]
  },
  {
    "name": "Paper",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/Paper.png",
    "description": ["Staples and paper clips are okay."]
  },
  {
    "name": "Paper cups",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/PaperCups.png",
    "description": ["Put this item in your trash bin."]
  },
  {
    "name": "Plastic bottles and caps",
    "image": "https://raw.githubusercontent.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/assets/images/PlasticBottle.png",
    "description": [
      "Empty and replace cap.",
      "There is a five cent deposit on carbonated soft drink, beer, malt beverage, and sparkling water containers sold in Massachusetts. Items that meet that description",
      "can be returned for a \$0.05 deposit at a local grocery store or redemption center. Find a redemption center near you.",
      "Or, you can put in your recycling bin.",
      "We have recently gotten questions about whether the plastic sleeves on plastic bottles should be removed and we are updating our response.  For labels that are clearly asking to be removed, the answer is YES, remove them.  These labels can impact the recyclability of plastic containers because during the sorting process the labels can mask the type of plastic resin the bottle is made from, which may result in the bottles being missorted and/or not being recycled.",
      "Normally, labels on plastic containers aren’t problematic and can simply remain on the bottle, jar, jug or tub.  Most labels are either recycled with the container if it’s the same resin or handled by the reclaimer.  So, if you see a bottle, jar, jug or tub with a label that asks you to remove it, please do!"
    ]
  }
];
List<String> popularCategoryNames = ["Paper", "Cans", "Boxes", "Batteries"];
// List popularCategoryList = categoryList
//     .where((x) => ["Paper", "Cans", "Boxes", "Batteries"].contains(x["name"]))
//     .toList();
List<Map<String,dynamic>> defaultLocations = [
  {
    "name":"GSU",
    "address":"775 Commonwealth avenue floor 1",
    "image":"images/PlasticBottle.png",
    "howToFindBins":{
      "bin 1":[
        "go right across starbucks"
      ],
      "bin 2":[
        "walk",
        "dance",
        "fly"
      ]
    }
  }
];