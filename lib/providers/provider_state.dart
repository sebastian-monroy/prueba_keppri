import 'package:flutter/material.dart';

class ProviderState with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController operationController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();

  String? _frequentPain;
  String? _boneIssues;

  String? get frequentPain => _frequentPain;
  String? get boneIssues => _boneIssues;

  bool get isValid => formKey.currentState?.validate() ?? false;

  void validateForm() {
    notifyListeners();
  }

  void updateFrequentPain(String? value) {
    _frequentPain = value;
    notifyListeners();
  }

  void updateBoneIssues(String? value) {
    _boneIssues = value;
    notifyListeners();
  }

  bool isFormComplete() {
    return operationController.text.trim().isNotEmpty &&
        diagnosisController.text.trim().isNotEmpty;
        
  }

  void resetForm() {
    formKey.currentState?.reset();
    operationController.clear();
    diagnosisController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    operationController.dispose();
    diagnosisController.dispose();
    super.dispose();
  }
}
