import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_ui/utli/my_buttons.dart';
import 'package:wallet_ui/utli/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //appbar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                  //plus button
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),
            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 57457.00,
                    cardNumber: 12475697,
                    expiryMonth: 05,
                    expiryYear: 25,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 57457.00,
                    cardNumber: 12345678,
                    expiryMonth: 03,
                    expiryYear: 24,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 74447.10,
                    cardNumber: 87456123,
                    expiryMonth: 09,
                    expiryYear: 28,
                    color: Colors.green[300],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //3 button -> send + pay + bills
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //send button
                MyButtons(
                  iconImagePath: 'lib/icons/money.png',
                  buttonText: 'Send',
                ),
                //pay button
                MyButtons(
                  iconImagePath: 'lib/icons/credit-card.png',
                  buttonText: 'Pay',
                ),
                //bills button
                MyButtons(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'Bills ',
                ),
              ],
            ),
            // column -> stats + transaction
          ],
        ),
      ),
    );
  }
}
