import 'package:flutter/material.dart';
import 'package:fitness/core/helpers/extinsions.dart';
import 'package:fitness/core/routing/routes.dart';
import 'package:fitness/core/theme/styles.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h(context)),
              Text(
                "Tell Us About You",
                style: TextStyles.font24BlackW700Inter(context),
              ),
              SizedBox(height: 8.h(context)),
              Text(
                "Help us personalize your experience",
                style: TextStyles.font14GreyW400Inter(context),
              ),
              SizedBox(height: 48.h(context)),
              _buildInputField(
                label: "Age",
                hint: "33",
                controller: _ageController,
              ),
              SizedBox(height: 24.h(context)),
              _buildInputField(
                label: "Weight (kg)",
                hint: "75",
                controller: _weightController,
              ),
              SizedBox(height: 24.h(context)),
              _buildInputField(
                label: "Height (cm)",
                hint: "175",
                controller: _heightController,
              ),
              SizedBox(height: 64.h(context)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamedAndRemoveUntil(Routes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Complete Setup",
                        style: TextStyles.font16WhiteW700Inter(context),
                      ),
                      SizedBox(width: 8.w(context)),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font14GreyW600Inter(context).copyWith(color: Colors.black87),
        ),
        SizedBox(height: 12.h(context)),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          ),
          style: TextStyles.font16BlackW400Inter(context),
        ),
      ],
    );
  }
}
