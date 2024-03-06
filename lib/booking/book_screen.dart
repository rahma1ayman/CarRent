import 'package:car_app/booking/payment_model.dart';
import 'package:car_app/booking/time_date_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  bool credit = true;
  bool debit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const CircleAvatar(
          backgroundImage: AssetImage('images/Cute dpz.jpeg'),
          radius: 8,
        ),
        title: const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15),
          child: Container(
            color: const Color(0xff3DA7E1),
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Color(0xff3DA7E1)),
                  hintText: 'Enter your address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hoverColor: Colors.blueAccent,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff3DA7E1),
                    ),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff3DA7E1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  height: 280,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Depart',
                        style: TextStyle(color: Color(0xff3DA7E1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            DateFormat('EEEE').format(selectedDate),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            '${DateFormat('d MMM ,').format(selectedDate)} ${DateFormat('h:mm a').format(selectedDate)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing:
                              CalenderButtonDep(onDateSelected: (newDate) {
                            setState(() {
                              selectedDate = newDate;
                            });
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Arrival',
                        style: TextStyle(color: Color(0xff3DA7E1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            DateFormat('EEEE').format(selectedDate2),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            '${DateFormat('d MMM ,').format(selectedDate2)} ${DateFormat('h:mm a').format(selectedDate2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: CalenderButtonDep(
                            onDateSelected: (newDate) {
                              setState(() {
                                selectedDate2 = newDate;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentModel(
                  title: 'Credit Card',
                  onTap: () {
                    setState(() {
                      credit = true;
                      debit = false;
                    });
                  },
                  isSelected: credit,
                ),
                PaymentModel(
                  title: 'Debit',
                  onTap: () {
                    setState(() {
                      credit = false;
                      debit = true;
                    });
                  },
                  isSelected: debit,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1),
              ),
              child: const Text(
                '+      Add New Card',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            ListTile(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              leading: const Icon(Icons.credit_card),
              title: const Text(
                'Mastercard',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                '************1211',
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle_outline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff3DA7E1)),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(400, 50), // Adjust width and height as needed
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    '150 \$',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
