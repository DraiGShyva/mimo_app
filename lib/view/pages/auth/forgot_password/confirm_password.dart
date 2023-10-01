import 'package:flutter/material.dart';
import 'package:mimoapp/view/pages/auth/forgot_password/change_password.dart';
import 'package:mimoapp/view/resource/responsive.dart';
import 'package:mimoapp/view/resource/text_style.dart';
import 'package:pinput/pinput.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nhập mã xác nhận',
              style: TextStyleClass(fontWeight: FontWeight.bold)
                  .textStyleLarge(context),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Responsive.size(context) * 0.05,
                right: Responsive.size(context) * 0.2,
                left: Responsive.size(context) * 0.2,
                bottom: Responsive.size(context) * 0.1,
              ),
              child: Text(
                'Vui lòng nhập mã xác nhận được gửi đến số điện thoại hoặc email của bạn.',
                style: TextStyleClass(
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.w300)
                    .textStyleSmall(context),
                textAlign: TextAlign.center,
              ),
            ),
            Pinput(
              onCompleted: (pin) {
                if (pin == '2222' //TODO: Kiểm tra mã
                    ) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ),
                  );
                }
              },
              validator: (pin) {
                return pin == '2222' //TODO: Kiểm tra mã
                    ? null
                    : 'Pin is incorrect';
              },
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(25, 129, 215, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: Responsive.size(context) * 0.05,
            ),
            TextButton(
              onPressed: () {
                //TODO: Gửi lại mã
              },
              child: Text(
                'Gửi lại mã',
                style: TextStyleClass(
                        color: const Color.fromRGBO(25, 129, 215, 1),
                        fontWeight: FontWeight.w600)
                    .textStyleSmall(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
