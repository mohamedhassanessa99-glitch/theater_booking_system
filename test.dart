// booked => true
// empty => false
import 'dart:io';

List<List<bool>> seats = List.generate(5, (int index) => List.filled(5, false));
Map<List<int>, Map<String, String>> bookings = {};

void main() {
  bool flag = true;
  while (flag) {
    displayOptions();
    int choice = userInput();
    switch (choice) {
      case 1:
        displaySeats();
      case 2:
        newBook();
      case 3:
        displayBookings();
      case 4:
        flag = false;
      default:
        print("Invalid choice");
    }
  }
}

void displayOptions() {
  print("1. Display Seats");
  print("2. New Booking");
  print("3. Display Bookings");
  print("4. Exit");
  print("Enter your choice:");
}

void displaySeats() {
  print("Seats:");
  for (int i = 0; i < seats.length; i++) {
    for (int j = 0; j < seats[i].length; j++) {
      if (seats[i][j]) {
        stdout.write(" B");
      } else {
        stdout.write(" E");
      }
    }
    print("");
  }
}

newBook() {
  print("Enter row number (0-4):");
  int row = userInput();
  print("Enter seat number (0-4):");
  int seat = userInput();

  if (row < 0 || row >= seats.length || seat < 0 || seat >= seats[row].length) {
    print("Invalid seat selection.");
    return;
  }

  if (seats[row][seat]) {
    print("Seat already booked.");
    return;
  }

  seats[row][seat] = true;
  print("Booking successful. Enter your name:");
  String name = stdin.readLineSync()!;
  print("Enter your phone number:");
  String phone = stdin.readLineSync()!;
  bookings[[row, seat]] = {"name": name, "phone": phone};
}

displayBookings() {
  print("Current Bookings:");
  bookings.forEach((key, value) {
    print(
      "Row: ${key[0]}, Seat: ${key[1]}, Name: ${value['name']}, Phone: ${value['phone']}",
    );
  });
}

int userInput() {
  return int.parse(stdin.readLineSync()!);
}
