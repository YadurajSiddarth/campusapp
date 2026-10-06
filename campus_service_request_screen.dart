import 'package:flutter/material.dart';

class CampusServiceRequestScreen extends StatefulWidget {
  const CampusServiceRequestScreen({super.key});

  @override
  State<CampusServiceRequestScreen> createState() =>
      _CampusServiceRequestScreenState();
}

class _CampusServiceRequestScreenState
    extends State<CampusServiceRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'Yaduraj Siddarth');
  final studentIdController = TextEditingController(text: 'CMR2026CSE001');
  final emailController = TextEditingController(text: 'yadurajs@uni.edu.in');
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final detailsController = TextEditingController();

  String? selectedService;
  String? selectedUrgency;
  String? selectedContact;
  DateTime? selectedDate;
  bool declarationAccepted = false;

  final List<String> services = [
    'Academic Support',
    'Library',
    'IT Support',
    'Accommodation',
    'Facilities',
  ];

  final List<String> urgencyLevels = ['Normal', 'Soon', 'Urgent'];

  final List<String> contactMethods = ['Email', 'Phone'];

  @override
  void dispose() {
    nameController.dispose();
    studentIdController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final today = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!declarationAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please confirm that the information provided is correct.',
          ),
        ),
      );
      return;
    }

    _formKey.currentState!.save();

    _showSuccessDialog();
  }

  void _resetForm() {
    _formKey.currentState!.reset();

    setState(() {
      selectedService = null;
      selectedUrgency = null;
      selectedContact = null;
      selectedDate = null;
      declarationAccepted = false;
    });

    nameController.text = 'Yaduraj Siddarth';
    studentIdController.text = 'CMR2026CSE001';
    emailController.text = 'yadurajs@uni.edu.in';
    phoneController.clear();
    subjectController.clear();
    detailsController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Form has been reset.')));
  }

  void _showSuccessDialog() {
    final formattedDate =
        '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Request Submitted'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your campus service request has been submitted successfully.',
                ),
                const SizedBox(height: 20),
                Text(
                  'Request Reference',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('CSR-2026-001'),
                const SizedBox(height: 14),
                Text(
                  'Service',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(selectedService!),
                const SizedBox(height: 14),
                Text(
                  'Urgency',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(selectedUrgency!),
                const SizedBox(height: 14),
                Text(
                  'Preferred Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(selectedContact!),
                const SizedBox(height: 14),
                Text(
                  'Preferred Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(formattedDate),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('DONE'),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FA),
      appBar: AppBar(
        title: const Text(
          'CampusConnect',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF174A7C),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF174A7C),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Service Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Submit a request to a campus service unit.',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Student Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 14),

                CampusTextField(
                  controller: nameController,
                  label: 'Student Name',
                  hint: 'Enter your full name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name';
                    }

                    if (value.trim().split(' ').length < 2) {
                      return 'Please enter your first and last name';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 16),

                CampusTextField(
                  controller: studentIdController,
                  label: 'Student ID',
                  hint: 'Example: CMR2026CSE001',
                  icon: Icons.badge,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your student ID';
                    }

                    if (value.trim().length < 8) {
                      return 'Student ID is too short';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 16),

                CampusTextField(
                  controller: emailController,
                  label: 'Campus Email',
                  hint: 'name@uni.edu.in',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your campus email';
                    }

                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email address';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 16),

                CampusTextField(
                  controller: phoneController,
                  label: 'Phone Number',
                  hint: 'Optional',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }

                    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');

                    if (digits.length < 10) {
                      return 'Enter a valid phone number';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 28),

                const Text(
                  'Request Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 14),

                DropdownButtonFormField<String>(
                  value: selectedService,
                  decoration: InputDecoration(
                    labelText: 'Service Category',
                    prefixIcon: const Icon(Icons.miscellaneous_services),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  items: services.map((service) {
                    return DropdownMenuItem(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedService = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a service category';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 16),

                CampusTextField(
                  controller: subjectController,
                  label: 'Request Subject',
                  hint: 'Briefly describe the issue',
                  icon: Icons.subject,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a request subject';
                    }

                    if (value.trim().length < 5) {
                      return 'Please provide a meaningful subject';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 16),

                CampusTextField(
                  controller: detailsController,
                  label: 'Request Details',
                  hint: 'Explain your request clearly',
                  icon: Icons.description,
                  maxLines: 5,
                  maxLength: 300,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please describe your request';
                    }

                    if (value.trim().length < 20) {
                      return 'Please enter at least 20 characters';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),

                const SizedBox(height: 24),

                const Text(
                  'Urgency',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                FormField<String>(
                  initialValue: selectedUrgency,
                  validator: (value) {
                    if (selectedUrgency == null) {
                      return 'Please select an urgency level';
                    }

                    return null;
                  },
                  builder: (field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: urgencyLevels.map((level) {
                            return ChoiceChip(
                              label: Text(level),
                              selected: selectedUrgency == level,
                              onSelected: (selected) {
                                setState(() {
                                  selectedUrgency = selected ? level : null;
                                });
                                field.didChange(selected ? level : null);
                              },
                            );
                          }).toList(),
                        ),
                        if (field.hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),

                const Text(
                  'Preferred Contact',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                FormField<String>(
                  initialValue: selectedContact,
                  validator: (value) {
                    if (selectedContact == null) {
                      return 'Please select a contact method';
                    }

                    return null;
                  },
                  builder: (field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: contactMethods.map((method) {
                            return ChoiceChip(
                              label: Text(method),
                              selected: selectedContact == method,
                              onSelected: (selected) {
                                setState(() {
                                  selectedContact = selected ? method : null;
                                });
                                field.didChange(selected ? method : null);
                              },
                            );
                          }).toList(),
                        ),
                        if (field.hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),

                const Text(
                  'Preferred Date',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                FormField<DateTime>(
                  validator: (value) {
                    if (selectedDate == null) {
                      return 'Please choose a preferred date';
                    }

                    final today = DateTime.now();

                    final selected = DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                    );

                    final current = DateTime(
                      today.year,
                      today.month,
                      today.day,
                    );

                    if (selected.isBefore(current)) {
                      return 'Date cannot be in the past';
                    }

                    return null;
                  },
                  builder: (field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _selectDate();
                            field.didChange(selectedDate);
                          },
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    selectedDate == null
                                        ? 'Choose preferred date'
                                        : _formatDate(selectedDate!),
                                    style: TextStyle(
                                      color: selectedDate == null
                                          ? Colors.grey.shade700
                                          : Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        if (field.hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 12),
                            child: Text(
                              field.errorText!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                const Text(
                  'Confirmation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: CheckboxListTile(
                    value: declarationAccepted,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'I confirm that the information provided is correct.',
                    ),
                    onChanged: (value) {
                      setState(() {
                        declarationAccepted = value ?? false;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _submitForm,
                        icon: const Icon(Icons.send),
                        label: const Text('SUBMIT REQUEST'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF174A7C),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      onPressed: _resetForm,
                      icon: const Icon(Icons.refresh),
                      label: const Text('RESET'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'All required information will be checked before submission.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CampusTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CampusTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved,
      textInputAction: maxLines > 1
          ? TextInputAction.newline
          : TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF174A7C), width: 2),
        ),
      ),
    );
  }
}
