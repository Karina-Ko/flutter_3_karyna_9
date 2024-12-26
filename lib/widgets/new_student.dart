import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/student.dart';
import '../widgets/text_input_field.dart';
import '../widgets/dropdown_input_field.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({super.key, required this.onSave, this.existingStudent});

  final Function(Student) onSave;
  final Student? existingStudent;

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController gradeController;

  Gender selectedGender = Gender.male;
  Department selectedDepartment = Department.engineering;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

    final existingStudent = widget.existingStudent;
    firstNameController =
        TextEditingController(text: existingStudent?.firstName ?? '');
    lastNameController =
        TextEditingController(text: existingStudent?.lastName ?? '');
    gradeController = TextEditingController(
        text: existingStudent != null ? existingStudent.grade.toString() : '');
    selectedGender = existingStudent?.gender ?? Gender.male;
    selectedDepartment = existingStudent?.department ?? Department.sports;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputField(
            controller: firstNameController,
            labelText: 'First Name',
            maxLength: 50,
          ),
          const SizedBox(height: 16.0),
          TextInputField(
              controller: lastNameController,
              labelText: 'Last Name',
              maxLength: 50),
          const SizedBox(height: 16.0),
          TextInputField(
            controller: gradeController,
            labelText: 'Grade',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          DropdownInputField<Gender>(
            value: selectedGender,
            items: Gender.values,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
            labelText: 'Gender',
          ),
          const SizedBox(height: 16.0),
          DropdownInputField<Department>(
            value: selectedDepartment,
            items: Department.values,
            onChanged: (value) {
              setState(() {
                selectedDepartment = value!;
              });
            },
            labelText: 'Department',
          ),
          const SizedBox(height: 16.0),
          _isLoading 
              ? const Center(child: CircularProgressIndicator())
          : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                      onPressed: () async {
                        setState(() => _isLoading = true); 
                        try {
                          final newStudent = Student(
                            id: Uuid().v4(),
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            department: selectedDepartment,
                            grade: int.parse(gradeController.text),
                            gender: selectedGender,
                          );
                          await Future.delayed(const Duration(milliseconds: 500));
                          widget.onSave(newStudent);
                          Navigator.of(context).pop();
                        } catch (e) {
                          print('Error creating student: $e');
                        } finally {
                          setState(() => _isLoading = false); 
                        }
                      },
                      child: _isLoading ? const CircularProgressIndicator() : const Text('Save Student'),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}