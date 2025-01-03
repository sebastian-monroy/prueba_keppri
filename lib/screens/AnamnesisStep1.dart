import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_keppri/widgets/custom_appbar.dart';
import 'package:prueba_keppri/widgets/custom_elevated_button.dart';

import '../providers/provider_state.dart';

class Anamnesisstep1 extends StatelessWidget {
  const Anamnesisstep1({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProviderState>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'Bienvenido a tu nuevo comienzo',
        backgroundColor: Colors.black,
        titleColor: Colors.white,
        leadingIcon: Icons.arrow_back,
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Form(
            key: formProvider.formKey,
            onChanged: formProvider.validateForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Completa la siguiente información',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: const TextSpan(
                    text: 'Todos los campos son obligatorios ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text:
                        '¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: formProvider.operationController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Escribe aquí',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Este campo es obligatorio'
                      : null,
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text:
                        '¿Tiene o tuvo alguna enfermedad diagnosticada o tratada por un médico? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: formProvider.diagnosisController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Escribe aquí',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Este campo es obligatorio'
                      : null,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        child: CustomElevatedButton(
          text: 'Siguiente',
          onPressed: formProvider.isValid
              ? () {
                  Navigator.pushNamed(context, '/step2');
                }
              : null,
          isEnabled: formProvider.isValid,
        ),
      ),
    );
  }
}
