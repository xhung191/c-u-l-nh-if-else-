import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Step 2: classify a score with if / else
String xepLoai(double diem) {
  if (diem < 0 || diem > 10) {
    return 'Không hợp lệ';
  } else if (diem >= 8.0) {
    return 'Giỏi';
  } else if (diem >= 6.5) {
    return 'Khá';
  } else if (diem >= 5.0) {
    return 'Trung bình';
  } else {
    return 'Yếu';
  }
}

// Step 3: text color chosen with if
Color mauChu(String loai) {
  if (loai == 'Giỏi') {
    return const Color(0xFF2E7D32);
  } else if (loai == 'Khá') {
    return const Color(0xFF1565C0);
  } else if (loai == 'Trung bình') {
    return const Color(0xFFEF6C00);
  } else if (loai == 'Yếu') {
    return const Color(0xFFC62828);
  } else {
    return const Color(0xFF616161);
  }
}

// Background color for the badge
Color mauNen(String loai) {
  if (loai == 'Giỏi') {
    return const Color(0xFFE0F2E1);
  } else if (loai == 'Khá') {
    return const Color(0xFFE3EDFB);
  } else if (loai == 'Trung bình') {
    return const Color(0xFFFFF0D9);
  } else if (loai == 'Yếu') {
    return const Color(0xFFFCE4E4);
  } else {
    return const Color(0xFFECEFF1);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XepLoaiPage(),
    );
  }
}

class XepLoaiPage extends StatelessWidget {
  const XepLoaiPage({super.key});

  // Step 1: the score variable
  final double diem = 8.5;

  // Step 4: extra test scores
  final List<double> diemKiemTra = const [9, 7, 5.5, 3, 11];

  // Format 9.0 -> "9", 5.5 -> "5.5"
  String fmt(double d) => d == d.roundToDouble() ? d.toInt().toString() : d.toString();

  Widget badge(String loai, double size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: mauNen(loai),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        loai,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: mauChu(loai),
        ),
      ),
    );
  }

  Widget dong(double d, bool coKe) {
    final loai = xepLoai(d);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Điểm ${fmt(d)}', style: const TextStyle(fontSize: 15)),
              badge(loai, 13),
            ],
          ),
        ),
        if (coKe) Container(height: 1, color: const Color(0xFFEEEEEE)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final loai = xepLoai(diem);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B4170),
        foregroundColor: Colors.white,
        title: const Text('Xếp loại học lực'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Điểm trung bình',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const SizedBox(height: 8),
                  Text(fmt(diem),
                      style: const TextStyle(
                          fontSize: 56, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: mauNen(loai),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      loai,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: mauChu(loai)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('KIỂM TRA THÊM',
                style: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54)),
            const SizedBox(height: 8),
            // Extra checks card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  dong(diemKiemTra[0], true),
                  dong(diemKiemTra[1], true),
                  dong(diemKiemTra[2], true),
                  dong(diemKiemTra[3], true),
                  dong(diemKiemTra[4], false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}