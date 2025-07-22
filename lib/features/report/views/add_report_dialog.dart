import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';

class AddReportDialog extends StatefulWidget {
  const AddReportDialog({Key? key}) : super(key: key);

  @override
  State<AddReportDialog> createState() => _AddReportDialogState();
}

class _AddReportDialogState extends State<AddReportDialog> {
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _photosController = TextEditingController();

  String _selectedReportType = 'Dumped';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        title: const Text(
          'Add Report',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'TripSans-Regular',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.black54),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What are you reporting?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontFamily: 'TripSans-Regular',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Report Type Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildReportTypeIcon(
                        AppAssets.rubbishIcon,
                        'Dumped',
                        'Dumped',
                      ),
                      _buildReportTypeIcon(
                        AppAssets.graffitiIcon,
                        'Graffiti',
                        'Graffiti',
                      ),
                      _buildReportTypeIcon(
                        AppAssets.pedestrianIcon,
                        'Pedestrian',
                        'Pedestrian',
                      ),
                      _buildReportTypeIcon(
                        AppAssets.trafficIcon,
                        'Traffic',
                        'Traffic',
                      ),
                      _buildReportTypeIcon(AppAssets.other, 'Other', 'Other'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Answering "Other" allows provide details in the description.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.4,
                      fontFamily: 'TripSans-Regular',
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildTextField('Location', _locationController),
                  const SizedBox(height: 24),
                  _buildTextField(
                    'Description',
                    _descriptionController,
                    isDescription: true,
                  ),
                  const SizedBox(height: 24),
                  _buildTextField('Value', _valueController, isLarge: true),
                  const SizedBox(height: 24),
                  _buildTextField('Photos (optional)', _photosController),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          // Bottom buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, -2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'TripSans-Regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'TripSans-Regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'TripSans-Regular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTypeIcon(String iconPath, String type, String label) {
    bool isSelected = _selectedReportType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReportType = type;
        });
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey[200]!,
                width: 1.5,
              ),
            ),
            child: Image.asset(
              iconPath,
              width: 32,
              height: 32,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
            //Icon(
            //   icon,
            //   color: isSelected ? Colors.white : Colors.grey[700],
            //   size: 26,
            // ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              height: 1.2,
              fontWeight: FontWeight.w500,
              fontFamily: 'TripSans-Regular',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isDescription = false,
    bool isLarge = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: 'TripSans-Regular',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            maxLines: isDescription ? 4 : (isLarge ? 8 : 1),
            decoration: InputDecoration(
              hintText: 'Value',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.green, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              filled: true,
              fillColor: Colors.grey[50],
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        if (isDescription) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.format_bold, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Icon(Icons.format_italic, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Icon(Icons.format_underlined, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 16),
              Icon(
                Icons.format_list_bulleted,
                size: 20,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.format_list_numbered,
                size: 20,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 16),
              Icon(Icons.link, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Icon(Icons.image, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Icon(Icons.attach_file, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Icon(
                Icons.emoji_emotions_outlined,
                size: 20,
                color: Colors.grey[600],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
