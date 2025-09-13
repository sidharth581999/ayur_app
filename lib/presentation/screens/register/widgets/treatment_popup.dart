import 'package:flutter/material.dart';

Future<void> showTreatmentDialog(BuildContext context) async {
  int maleCount = 0;
  int femaleCount = 0;
  String? selectedTreatment;

  final treatments = ["Massage", "Therapy", "Ayurveda"]; // sample data

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdown
                  Text("Choose Treatment",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: "Choose preferred treatment",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    value: selectedTreatment,
                    items: treatments
                        .map((t) => DropdownMenuItem(
                              value: t,
                              child: Text(t),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedTreatment = value);
                    },
                  ),
                  const SizedBox(height: 20),

                  // Male counter
                  Text("Add Patients", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  _buildCounterRow(
                    label: "Male",
                    count: maleCount,
                    onIncrement: () => setState(() => maleCount++),
                    onDecrement: () {
                      if (maleCount > 0) setState(() => maleCount--);
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildCounterRow(
                    label: "Female",
                    count: femaleCount,
                    onIncrement: () => setState(() => femaleCount++),
                    onDecrement: () {
                      if (femaleCount > 0) setState(() => femaleCount--);
                    },
                  ),
                  const SizedBox(height: 24),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, {
                          "treatment": selectedTreatment,
                          "male": maleCount,
                          "female": femaleCount,
                        });
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildCounterRow({
  required String label,
  required int count,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(fontSize: 16)),
      Row(
        children: [
          _circleButton(icon: Icons.remove, onTap: onDecrement),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(count.toString(), style: TextStyle(fontSize: 16)),
            ),
          ),
          _circleButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    ],
  );
}

Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Icon(icon, color: Colors.white, size: 20),
    ),
  );
}
