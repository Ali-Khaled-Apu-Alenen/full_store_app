import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10.h),
        width: 343.w,
        height: 52.h,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                "https://imgs.search.brave.com/P-gPpVuRsayhBqMhHiubgE-nMRZ_VfX9-yQmwTyrtBk/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi82LzZiL0xp/b25lbF9NZXNzaV9X/aGl0ZV9Ib3VzZV8y/MDI2XyUyODN4NF9j/cm9wcGVkJTI5Lmpw/Zy8yNTBweC1MaW9u/ZWxfTWVzc2lfV2hp/dGVfSG91c2VfMjAy/Nl8lMjgzeDRfY3Jv/cHBlZCUyOS5qcGc_/dXRtX3NvdXJjZT1l/bi53aWtpcGVkaWEu/b3JnJmFtcDt1dG1f/Y2FtcGFpZ249cGFy/c2VyJmFtcDt1dG1f/Y29udGVudD10aHVt/Ym5haWw",
              ),
            ),
            SizedBox(width: 16),
            Column(children: [Text("Ali Khalid"), Text("ali@gmail.com")]),
            Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
