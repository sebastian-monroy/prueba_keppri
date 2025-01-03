import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_keppri/widgets/custom_appbar.dart';
import 'package:prueba_keppri/widgets/custom_elevated_button.dart';
import '../providers/provider_state.dart';

class Anamnesisstep2 extends StatelessWidget {
  const Anamnesisstep2({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<ProviderState>(context);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
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
                  SizedBox(height: height * 0.01),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Todos los campos son obligatorios ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                  SizedBox(height: height * 0.03),
                  _buildQuestion(
                    width,
                    '¿Tiene dolores frecuentes y no ha consultado al médico? ',
                    'frequentPain',
                    formProvider,
                  ),
                  SizedBox(height: height * 0.03),
                  _buildQuestion(
                    width,
                    '¿Le ha dicho el médico que tiene algún problema en los huesos o las articulaciones, que pueda desfavorecer con el ejercicio? ',
                    'boneIssues',
                    formProvider,
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomElevatedButton(
            text: 'Siguiente',
            onPressed: formProvider.isFormComplete()
                ? () {
                    if (formProvider.formKey.currentState?.validate() ??
                        false) {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: const Text('Confirmación'),
                                content: const Text(
                                    'Informacion recolectada con exito! '),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        Navigator.pushNamed(
                                            context, '/confirmation');
                                      });
                                    },
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              ));
                    }
                  }
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(double width, String question, String fieldKey,
      ProviderState formProvider) {
    final isFrequentPain = fieldKey == 'frequentPain';
    final isSelectedYes = isFrequentPain
        ? formProvider.frequentPain == 'Sí'
        : formProvider.boneIssues == 'Sí';
    final isSelectedNo = isFrequentPain
        ? formProvider.frequentPain == 'No'
        : formProvider.boneIssues == 'No';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: const SizedBox(width: 100, child: Text('Sí')),
              selected: isSelectedYes,
              onSelected: (selected) {
                if (isFrequentPain) {
                  formProvider.updateFrequentPain(selected ? 'Sí' : null);
                } else {
                  formProvider.updateBoneIssues(selected ? 'Sí' : null);
                }
              },
            ),
            SizedBox(width: width * 0.02),
            ChoiceChip(
              label: const SizedBox(width: 100, child: Text('No')),
              selected: isSelectedNo,
              onSelected: (selected) {
                if (isFrequentPain) {
                  formProvider.updateFrequentPain(selected ? 'No' : null);
                } else {
                  formProvider.updateBoneIssues(selected ? 'No' : null);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
