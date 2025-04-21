import 'dart:io';

Map<String, int> menu = {"burger": 30, "pizza": 35, "fries": 10, "soda": 5};
List<String> order = [];
String name = "AbdulazizAlotaibi";

// function to show menu
void showMenu() {
  while (true) {
    print("-------------------------------");
    print("Menu : \n");
    // forEach loop to print item and price from the menu
    menu.forEach((item, price) {
      print("$item: - $price SAR");
    });
    print("\ntype 1 to go back ");
    String? input = stdin.readLineSync()!.toLowerCase();
    if (input == "1") {
      main();
    } else {
      print("Invalid number");
      sleep(const Duration(seconds: 1));
    }
  }
}

// function to add orders to the list
void addOrder() {
  print("whats your order from the menu? type 1 to go back ");
  String? userOrder = stdin.readLineSync()!.toLowerCase();

  // loop to let the user add more orders or go back to the menu
  while (true) {
    // Check if the order is in the menu
    if (menu.containsKey(userOrder)) {
      order.add(userOrder!);
      print("$userOrder added to your order");
      sleep(const Duration(seconds: 1));
    } else if (userOrder == "1" || userOrder == "done") {
      main();
    } else {
      print("order not found on the menu");
      sleep(const Duration(seconds: 1));
    }
    print("Enter another order ( Enter 1 or done  to go back) ");
    userOrder = stdin.readLineSync();
  }
}

// function to display order and calculate total
void orderSummary() {
  int total = 0;
  if (order.isEmpty) {
    print("No items ordered yet.");
    sleep(const Duration(seconds: 1));
  } else {
    print("-------------------------------");
    print("Order Summary :\n");
    // forEach loop displays the ordered items and calculates the total price.
    order.forEach((item) {
      int price = menu[item]!;
      total += price;
      print("$item: $price");
    });
    print("\nTotal: $total SAR");
    print("\ntype 1 to go back ");
    String? input = stdin.readLineSync()!.toLowerCase();
    if (input == "1") {
      main();
    } else {
      print("Invalid number");
    }
  }
}

void main() {
  // Main loop: displays the menu options and handles user input
  while (true) {
    print("-------------------------------");
    print(" Choose a number : \n");
    print(" 1 : viewing the menu ");
    print(" 2 : placing an order ");
    print(" 3 : viewing the order summary ");
    print(" 4 : exiting ");
    print("Select a number");
    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
        showMenu();
      case "2":
        addOrder();
      case "3":
        orderSummary();
      case "4":
        exit(0);
      default:
        print("Invalid input");
        sleep(const Duration(seconds: 1));
    }
  }
}
