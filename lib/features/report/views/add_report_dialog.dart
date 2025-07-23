import 'package:flutter/material.dart';
import 'package:location_based_reporting_app/core/const/app_assets.dart';
import 'package:location_based_reporting_app/core/const/app_colors.dart';
import 'package:location_based_reporting_app/core/services/image_services.dart';
import 'package:location_based_reporting_app/core/services/location_service.dart';

import 'dart:io';

class AddReportDialog extends StatefulWidget {
  const AddReportDialog({Key? key}) : super(key: key);

  @override
  State<AddReportDialog> createState() => _AddReportDialogState();
}

class _AddReportDialogState extends State<AddReportDialog> {
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _selectedReportType = 'Dumped';
  bool _isLoadingLocation = false;
  bool _isLoadingMedia = false;
  List<String> _selectedImages = [];
  Map<String, dynamic>? _currentLocation;

  bool get _isFormValid {
    return _selectedReportType.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _locationController.dispose();
    _descriptionController.dispose();
    _valueController.dispose();
    super.dispose();
  }

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
            onPressed: () => _confirmDiscard(context),
            icon: const Icon(Icons.close, color: Colors.black54),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
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
                    _buildLocationField(),
                    const SizedBox(height: 24),
                    _buildTextField(
                      'Description',
                      _descriptionController,
                      isDescription: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    _buildTextField('Value', _valueController, isLarge: true),
                    const SizedBox(height: 24),
                    _buildPhotosField(),
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
                      onPressed: () => _confirmDiscard(context),
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
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _submitForm : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormValid
                            ? AppColors.primary
                            : Colors.grey[300],
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
    String? Function(String?)? validator,
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
          child: TextFormField(
            controller: controller,
            maxLines: isDescription ? 4 : (isLarge ? 8 : 1),
            validator: validator,
            decoration: InputDecoration(
              hintText: label,
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

  Widget _buildLocationField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
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
          child: TextFormField(
            controller: _locationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a location';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: _currentLocation != null
                  ? _currentLocation!['address']
                  : 'Tap to get current location',
              hintStyle: TextStyle(
                color: _currentLocation != null
                    ? Colors.black87
                    : Colors.grey[400],
                fontSize: 16,
              ),
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
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  _isLoadingLocation
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.my_location,
                            color: AppColors.primary,
                          ),
                          onPressed: _getCurrentLocation,
                        ),
                ],
              ),
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            readOnly: true,
            onTap: _getCurrentLocation,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos (optional)',
          style: TextStyle(
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
            decoration: InputDecoration(
              hintText: _selectedImages.isEmpty
                  ? 'Tap to add photos'
                  : '${_selectedImages.length} photo(s) selected',
              hintStyle: TextStyle(
                color: _selectedImages.isEmpty
                    ? Colors.grey[400]
                    : Colors.black87,
                fontSize: 16,
              ),
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
              suffixIcon: _isLoadingMedia
                  ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.primary,
                          ),
                          onPressed: _takePicture,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.photo_library_outlined,
                            color: AppColors.primary,
                          ),
                          onPressed: _pickImages,
                        ),
                      ],
                    ),
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            readOnly: true,
            onTap: _showMediaOptions,
          ),
        ),
        if (_selectedImages.isNotEmpty) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_selectedImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImages.removeAt(index);
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      final location = await LocationService.getCurrentLocation();
      setState(() {
        _currentLocation = location;
        _locationController.text = location?['address'] ?? '';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<void> _pickImages() async {
    setState(() => _isLoadingMedia = true);
    try {
      final images = await MediaService.pickImages();
      setState(() => _selectedImages.addAll(images));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking images: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoadingMedia = false);
    }
  }

  Future<void> _takePicture() async {
    setState(() => _isLoadingMedia = true);
    try {
      final imagePath = await MediaService.takePicture();
      if (imagePath != null) {
        setState(() => _selectedImages.add(imagePath));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error taking picture: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoadingMedia = false);
    }
  }

  void _showMediaOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Add Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMediaOption(
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  onTap: () {
                    Navigator.pop(context);
                    _takePicture();
                  },
                ),
                _buildMediaOption(
                  icon: Icons.photo_library_outlined,
                  label: 'Gallery',
                  onTap: () {
                    Navigator.pop(context);
                    _pickImages();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Icon(icon, size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit report: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _confirmDiscard(BuildContext context) async {
    if (!_isFormValid) {
      Navigator.pop(context);
      return;
    }

    final shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('Are you sure you want to discard this report?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
        ],
      ),
    );

    if (shouldDiscard == true) {
      Navigator.pop(context);
    }
  }
}
