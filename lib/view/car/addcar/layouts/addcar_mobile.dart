import 'package:flutter/material.dart';
import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:admin_rent/view/car/addcar/widgets/components.dart';
import 'package:admin_rent/view/car/addcar/widgets/image_selection.dart';

class MobileLayout extends StatelessWidget {
  final CarFormProvider carFormProvider;

  const MobileLayout({super.key, required this.carFormProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ExternalAppColors.secondaryBg,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: buildFormContent(carFormProvider),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                color: ExternalAppColors.secondaryBg,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const ImageSelectionWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormContent(CarFormProvider carFormProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddFormHeader(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  value: carFormProvider.selectedMake,
                  hint: 'Car brand',
                  onChanged: (value) => carFormProvider.updateMake(value),
                  items: ['Alfa Romeo', 'BMW', 'Mercedes', 'Audi'],
                ),
              ),
              const SizedBox(width: 12), // Add some space between dropdowns
              Expanded(
                child: _buildDropdown(
                  value: carFormProvider.model,
                  hint: 'Car model',
                  onChanged: (value) => carFormProvider.updateModel(value),
                  items: ['Model 1', 'Model 2', 'Model 3'],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Price range per hour',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          PriceRangeSlider(carFormProvider: carFormProvider),
          const SizedBox(height: 16),
          const PrimaryText(
            text: "Categories",
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          CarBodyType(carFormProvider: carFormProvider),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Available Vehicle Colors',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 16),
          CarColorWrap(carFormProvider: carFormProvider),
          const SizedBox(height: 16),
          const Divider(
            endIndent: 2,
            color: ExternalAppColors.white,
            thickness: 1,
          ),
          const CarStatus(),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Rental type',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 16),
          const RentalChoiceChip(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required Function(String?) onChanged,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}